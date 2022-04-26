//
//  NewProfileScreen.swift
//  PetBook
//
//  Created by Артем Черненко on 19.04.2022.
//

import SwiftUI

struct AddNewProfileScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var name = ""
    @State private var type = ""
    @State private var birthDate = ""
    private let types = ["Dog", "Cat", "bird", "fish", "насекошки"]
    
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
                TextField("Enter birth date", text: $birthDate)
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
        newItem.toHealth?.setValue(birthDate, forKey: "doc")
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
        AddNewProfileScreen()
    }
}
