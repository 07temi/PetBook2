//
//  RowNotes.swift
//  PetBook
//
//  Created by Артем Черненко on 25.04.2022.
//

import SwiftUI

struct RowNotes: View {
    let title: String
    let date: String
    @State var alarm: Bool
    @State var isComplete: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
            Text(title)
                    .font(.body)
            Text("\(date)")
                    .font(.footnote)
            }.padding(6)
            Spacer()
            Image(systemName: "bell.square")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(alarm ? .green : .gray)
                .onTapGesture {
                    alarm.toggle()
                }
            Image(systemName: "checkmark.square")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(isComplete ? .gray : .green)
                .onTapGesture {
                    isComplete.toggle()
                }
        }
        .padding(8)
        .frame(width: 250, height: 50)
        .background(Color(red: 0.5000, green: 0.6580, blue: 0.8589))
        .cornerRadius(10)
    }
}

struct RowNotes_Previews: PreviewProvider {
    static var previews: some View {
        RowNotes(title: "Title", date: "Date", alarm: true, isComplete: false )
    }
}
