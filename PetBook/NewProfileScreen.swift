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
            }
        }
        .toolbar {
            Button("Save", action: {addItem()} )
        }
    }
    
    private func addItem() {
        let newItem = Pets(context: viewContext)
        newItem.name = name
        newItem.type = type
//        newItem.linkToInfo?.setValue("test_pills", forKey: "pills")
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
