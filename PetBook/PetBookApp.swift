//
//  PetBookApp.swift
//  PetBook
//
//  Created by Артем Черненко on 19.04.2022.
//

import SwiftUI

@main
struct PetBookApp: App {
    
    @StateObject private var storageManager = StorageManager()
    //let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environment(\.managedObjectContext, storageManager.container.viewContext)
        }
//        WindowGroup {
//            HomeScreen()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//        }
    }
}
