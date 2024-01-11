//
//  PersistenceController.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-14.
//

import Foundation
import CoreData

struct PersistenceController {

    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        self.container = NSPersistentContainer(name: "Notes_App")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { _, error in
            if let error = error  as NSError? {
                fatalError("Error loading container: \(error), \(error.userInfo)")
            }
        }
    }

    func save() throws {
        let context = container.viewContext

        guard context.hasChanges else { return }

        do {
            try context.save()
        } catch let error as NSError {
            throw error
            print("error saving context: \(error)")
        }
    }
}
