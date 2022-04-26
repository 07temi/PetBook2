//
//  RowNotes.swift
//  PetBook
//
//  Created by Артем Черненко on 25.04.2022.
//

import SwiftUI

struct RowNotes: View {
    //передать переменные
    var body: some View {
        HStack {
            VStack {
            Text("Title")
            Text("Date here")
                    .font(.footnote)
            }
            Spacer()
            Image(systemName: "bell.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.gray)
            Image(systemName: "checkmark")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.gray)
        }
        .frame(width: 250, height: 50)
        .background(Color(.green))
        .cornerRadius(10)
    }
}

struct RowNotes_Previews: PreviewProvider {
    static var previews: some View {
        RowNotes()
    }
}
