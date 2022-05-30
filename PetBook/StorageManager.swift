//
//  StorageManager.swift
//  PetBook
//
//  Created by Артем Черненко on 30.05.2022.
//

import Foundation
import CoreData

class StorageManager: ObservableObject {
    let container = NSPersistentContainer(name: "PetBook")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
