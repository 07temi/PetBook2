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
            Text("\(pet.type!)")
            //Здесь ссылки на основные функции
            // Переход на экран 1
            //  -- Визит к доктору
            // Переход на экран 2
            // Переход на экран 3
            // Переход на экран 4
            if (pet.toHealth != nil){
                Text("\(pet.toHealth!.doc ?? "no data")")
            }
            Button("add note") {
                saveNotes()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack{
                    Image(pet.picture ?? "star.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 44, height: 44)
                        .cornerRadius(22)
                    Text("\(pet.name ?? "no name")")
                        .font(.largeTitle)
                }
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
