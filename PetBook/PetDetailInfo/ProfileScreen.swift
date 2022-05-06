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
        //VStack {
            List {
                ForEach(notesArray) {
                    note in HStack{
                        Spacer()
                        RowNote(note: note,
                                alarmState: note.alarm,
                                completeState: note.isComplete)
//                        RowNotes(title: note.title ?? "",
//                                 date: note.date?.formatted(date: .long, time: .omitted) ?? "", //формат говно, переделать
//                                 alarm: note.alarm,
//                                 isComplete: note.isComplete)
                        Spacer()
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)

            NavigationLink(destination: AddMedicineNotes(selectedProfile: selectedPet)) {
                Text("AddNotes")
            }
            //    saveNotes()
                
            //}
       // }
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
        Button("Back") {
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
