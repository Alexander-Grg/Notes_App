//
//  CoreDataStackTest.swift
//  Notes_AppTests
//
//  Created by Alexander Grigoryev on 2024-01-10.
//

import XCTest
import CoreData
@testable import Notes_App

final class CoreDataStackTest: XCTestCase {

    var persistenceManager: PersistenceController!
    var context: NSManagedObjectContext!
    var item: CDNotesModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        persistenceManager = PersistenceController(inMemory: true)
        context = persistenceManager.container.viewContext

        item = CDNotesModel(context: context)
        item.noteText = "TestText2"
        item.noteTitle = "Test title"
    }

    override func tearDownWithError() throws {
        persistenceManager = nil
        context = nil
        try super.tearDownWithError()
    }

    func testSaveData() throws {
        do {
           try persistenceManager.save()
        } catch {
            print(error)
        }
        let savedItem = try context.fetch(CDNotesModel.fetchRequest()).first


        XCTAssertEqual(savedItem, item)
    }

    func testFetchingData() throws {
       let savedItems = try context.fetch(CDNotesModel.fetchRequest())
        XCTAssertGreaterThan(savedItems.count, 0)
    }

    func testDataRemoval() throws {
        context.delete(item)
        let savedItems = try context.fetch(CDNotesModel.fetchRequest())
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }

        XCTAssertEqual(savedItems.count, 0)
    }

    func testInMemory() throws {
        guard let url = persistenceManager.container.persistentStoreDescriptions.first?.url
        else {throw XCTestError(.failureWhileWaiting) }
        XCTAssertEqual(url.absoluteString, "file:///dev/null")
    }
}
