//
//  ProfileScreen.swift
//  PetBook
//
//  Created by Артем Черненко on 19.04.2022.
//

import SwiftUI

struct ProfileScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
    //let selectedPet: Pets
    @State var selectedPet: Pets
    @State private var tags = 0
    //@FetchRequest(sortDescriptors: [SortDescriptor(\.date)]) var students: FetchedResults<Notes>
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //@Environment(\.managedObjectContext) private var viewContext
    
    private var notesArray: [Notes] {
        let set = selectedPet.petsToNotes as? Set<Notes> ?? []
        return set.sorted {
            $0.date ?? Date() < $1.date ?? Date()
        }
    }
    
    private var activeNotes: [Notes] {
        let set = selectedPet.petsToNotes as? Set<Notes> ?? []
        return set.filter {
            sort in return sort.isComplete == false
        }
    }
        
    var body: some View {
        //VStack {
        Picker("Filter array",selection: $tags){
            Text("Active").tag(0)
            Text("Inactive").tag(1)
        }
        .pickerStyle(.segmented)
        
        if tags == 0 {
            
            let filtered = notesArray.filter { note in
                return note.isComplete == false
            }
            List {
                ForEach(filtered) {
                note in HStack{
                        Spacer()
                    RowNote(note: note,
                            alarmState: note.alarm,
                            completeState: note.isComplete)
                        Spacer()
                    }
                }
//                .onDelete(perform: deleteNote)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        
        if tags == 1 {
            let filtered = notesArray.filter { note in
                return note.isComplete == true
            }
            List {
                ForEach(filtered) {
                    note in HStack{
                        Spacer()
                        RowNote(note: note,
                                alarmState: note.alarm,
                                completeState: note.isComplete)
                        Spacer()
                    }
                }
//                .onDelete(perform: deleteNote)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        
//            List {
//                ForEach(students) {
//                note in HStack{
//                        Spacer()
//                        RowNote(note: note,
//                                alarmState: note.alarm,
//                                completeState: note.isComplete)
//                        Spacer()
//                    }
//                }
////                .onDelete(perform: deleteNote)
//                .listRowSeparator(.hidden)
//            }
//            .listStyle(.plain)

            NavigationLink(destination: AddMedicineNotes(selectedProfile: selectedPet)) {
                Text("Добавить заметку")
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
    
//    private func deleteNote(at offsets: IndexSet) {
//        for index in offsets {
//            let note = notesArray[index]
//            viewContext.delete(note)
//        }
//        do {
//            try viewContext.save()
//        } catch {
//
//        }
//    }
    
//    private func saveNotes(){
//        let newNote = Health(context: viewContext)
//        newNote.id = UUID()
//        newNote.doc = "тестовое значение"
//        newNote.toPets = selectedPet
//    }
    private func saveState() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Fatal error \(nsError), \(nsError.userInfo)")
        }
    }
}


//struct ProfileScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileScreen()
//    }
//}
