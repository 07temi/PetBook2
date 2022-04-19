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
    var body: some View {
        VStack {
            //            Image(pet.picture ?? "star.fill")
            //                .resizable()
            //                .scaledToFill()
            //                .frame(width: 50, height: 50)
            //                .cornerRadius(25)
            Text("\(pet.type!)")
            Text("\(pet.name!)")
            
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
}


//struct ProfileScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileScreen()
//    }
//}
