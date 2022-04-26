//
//  ProfileScreen.swift
//  PetBook
//
//  Created by Артем Черненко on 19.04.2022.
//

import SwiftUI

struct ProfileScreen: View {
    let selectedPet: Pets
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    private var notesArray: [Notes] {
        let set = selectedPet.petsToNotes as? Set<Notes> ?? []
        return set.sorted {
            //тут надо отфильтровать по активности вместо сортировки
            $0.date ?? Date() < $1.date ?? Date()
        }
    }
    var body: some View {
        VStack {
            Text("\(selectedPet.type!)")
            
            List {
                ForEach(notesArray) {
                    note in HStack{
                        Spacer()
                        RowNotes(title: note.title ?? "",
                                 date: note.date?.formatted(date: .long, time: .omitted) ?? "", //формат говно, переделать
                                 isComplete: note.isComplete
                        )
                        Spacer()
                    }
                }
            }
            .listStyle(.plain)
            //Здесь ссылки на основные функции
            // Переход на экран 1
            //  -- Визит к доктору
            // Переход на экран 2
            //  -- Уход
            // Переход на экран 3
            //  -- Спорт/занятия с тренером
            // Переход на экран 4
            if (selectedPet.toHealth != nil){
                Text("\(selectedPet.toHealth!.doc ?? "no data")")
            }
            //Button("add note") {
            NavigationLink(destination: AddMedicineNotes(selectedProfile: selectedPet)) {
                Text("AddNotes")
            }
            //    saveNotes()
                
            //}
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack{
                    Image(selectedPet.picture ?? "star.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 44, height: 44)
                        .cornerRadius(22)
                    Text("\(selectedPet.name ?? "no name")")
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
        newNote.toPets = selectedPet
    }
}


//struct ProfileScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileScreen()
//    }
//}
