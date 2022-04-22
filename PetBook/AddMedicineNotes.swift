//
//  AddMedicineNotes.swift
//  PetBook
//
//  Created by Артем Черненко on 22.04.2022.
//

import SwiftUI

struct AddMedicineNotes: View {
    @Environment(\.managedObjectContext) private var viewContext
    //@State private var selectedProfile:Pets = Pets()
    let selectedProfile: Pets
    
    var body: some View {
        VStack {
            Text("\(selectedProfile.name ?? "")")
            Button("add note") {
                saveNotes()
            }
        }
    }
    private func saveNotes(){
        let newNote = Health(context: viewContext)
        newNote.id = UUID()
        newNote.doc = "тестовое значение"
        newNote.toPets = selectedProfile
    }
}

//struct AddMedicineNotes_Previews: PreviewProvider {
//    static var previews: some View {
//        AddMedicineNotes()
//    }
//}
