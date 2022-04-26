//
//  AddMedicineNotes.swift
//  PetBook
//
//  Created by Артем Черненко on 22.04.2022.
//

import SwiftUI

struct AddMedicineNotes: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var type = ""
    @State private var title = ""
    @State private var date = Date()
    @State private var descriptionNote = ""
    @State private var isComplete = false
    @State private var alarm = true

    private let types = ["Type_1", "Type_2", "Type_3"]
    
    let selectedProfile: Pets
    
    var body: some View {
        Form {
            Section {
                Picker("Select type", selection: $type) {
                    ForEach(types, id: \.self) { type in
                        Text(type)
                    }
                }
                TextField("title", text: $title)
                    .disableAutocorrection(true)
                //выбор даты
                TextEditor(text: $descriptionNote)
            }
        }
        .toolbar {
            Button("Save", action: {saveNote()} )
        }
    }
    private func saveNote(){
        let newNote = Notes(context: viewContext)
        newNote.id = UUID()
        newNote.type = type
        newNote.title = title
        newNote.date = date
        newNote.descriptionNote = descriptionNote
        newNote.isComplete = false
        newNote.alarm = true
        newNote.notesToPets = selectedProfile
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Fatal error \(nsError), \(nsError.userInfo)")
        }
    }
}

//struct AddMedicineNotes_Previews: PreviewProvider {
//    static var previews: some View {
//        AddMedicineNotes()
//    }
//}
