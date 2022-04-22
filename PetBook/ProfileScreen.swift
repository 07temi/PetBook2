//
//  ProfileScreen.swift
//  PetBook
//
//  Created by Артем Черненко on 19.04.2022.
//

import SwiftUI

struct ProfileScreen: View {
    let pet: Pets
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    var body: some View {
        VStack {
            //            Image(pet.picture ?? "star.fill")
            //                .resizable()
            //                .scaledToFill()
            //                .frame(width: 50, height: 50)
            //                .cornerRadius(25)
            Text("\(pet.type!)")
            Text("\(pet.name!)")
            if (pet.toHealth != nil){
                Text("\(pet.toHealth!.doc ?? "no data")")
            }
            Button("add note") {
                saveNotes()
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image(pet.picture ?? "star.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)
            }
        }
        .navigationBarBackButtonHidden(true)
        Spacer()
        Button("Save") {
            presentationMode.wrappedValue.dismiss()
        }
        .padding()
    }
    private func saveNotes(){
        let newNote = Health(context: viewContext)
        newNote.id = UUID()
        newNote.doc = "тестовое значение"
        newNote.toPets = pet
    }
}


//struct ProfileScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileScreen()
//    }
//}
