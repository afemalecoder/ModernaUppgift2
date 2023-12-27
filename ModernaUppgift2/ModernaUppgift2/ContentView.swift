//
//  ContentView.swift
//  ModernaUppgift2
//
//  Created by Matilda Cederberg on 27/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var newItem = ""
    @State private var items: [String] = []

    var body: some View {
        VStack {
            HStack {
                TextField("Skriv här", text: $newItem)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: addItem) {
                    Text("Lägg till")
                }
            }
            .padding()

            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: deleteItem)
            }

            Button(action: resetList) {
                Text("Nollställ")
            }
            .padding()
        }
    }

    func addItem() {
        if !newItem.isEmpty {
            items.append(newItem)
            newItem = ""
        }
    }

    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func resetList() {
        items.removeAll()
    }
}

#Preview {
    ContentView()
}
