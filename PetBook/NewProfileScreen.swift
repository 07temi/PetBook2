//
//  NewProfileScreen.swift
//  PetBook
//
//  Created by Артем Черненко on 19.04.2022.
//

import SwiftUI

struct NewProfileScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var name = ""
    @State private var type = ""
    @State private var doc = ""
    private let types = ["Dog", "Cat"]
    
    var body: some View {
        Form {
            Section {
                TextField("Enter name", text: $name)
                    .disableAutocorrection(true)
                Picker("Select type", selection: $type) {
                    ForEach(types, id: \.self) { type in
                        Text(type)
                    }
                }
                TextField("Enter doc", text: $doc)
                    .disableAutocorrection(true)
            }

        }
        .toolbar {
            Button("Save", action: {addItem()} )
        }
    }
    
    private func addItem() {
        let newItem = Pets(context: viewContext)
        newItem.id = UUID()
        newItem.name = name
        newItem.type = type
        newItem.toHealth?.setValue(doc, forKey: "doc")
        newItem.picture = "james"
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Fatal error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct NewProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewProfileScreen()
    }
}
