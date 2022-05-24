//
//  RowNote.swift
//  PetBook
//
//  Created by Артем Черненко on 05.05.2022.
//

import SwiftUI

struct RowNote: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    let note: Notes

    @State var alarmState: Bool
    @State var completeState: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                if let title = note.title {
                    Text(title)
                        .font(.body)
                }
                //Text(note.title ?? "no title")
                //    .font(.body)
                Text("\(note.date?.formatted(date: .long, time: .omitted) ?? "")")
                   .font(.footnote)
            }.padding(6)
            Spacer()
            Image(systemName: "bell.square")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(alarmState ? .green : .gray)
                .onTapGesture {
                    note.alarm.toggle()
                    alarmState = note.alarm
                    saveState()
                }
            Image(systemName: "checkmark.square")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(completeState ? .gray : .green)
                .onTapGesture {
                    note.isComplete.toggle()
                    completeState = note.isComplete
                    saveState()
                }
        }
        .padding(8)
        .frame(width: 250, height: 50)
        .background(Color(red: 0.6000, green: 0.7580, blue: 0.9589))
//        (Color(red: 0.5000, green: 0.6580, blue: 0.8589))
        .cornerRadius(10)
    }
    
    private func saveState() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Fatal error \(nsError), \(nsError.userInfo)")
        }
    }

}

//struct RowNote_Previews: PreviewProvider {
//    static var previews: some View {
//        RowNote()
//    }
//}
