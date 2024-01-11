//
//  NotesListVCtest.swift
//  Notes_AppTests
//
//  Created by Alexander Grigoryev on 2024-01-08.
//

import XCTest
import CoreData
@testable import Notes_App

class MockView: NotesView {

    var onNotesRetrievalCalled = false
    var onNotesDeletionCalled = false
    var indexPathOnDeletion: IndexPath?

    func onNotesRetrieval() {
        onNotesRetrievalCalled = true
    }

    func onNoteDeletion(index: IndexPath) {
        onNotesDeletionCalled = true
        indexPathOnDeletion = index
    }
}

final class NotesListVCtest: XCTestCase {
    var view: MockView!
    var presenter: NotesListPresenterImplementation!
    var persistenceController: PersistenceController!
    var item: CDNotesModel!
    var context: NSManagedObjectContext!

    override func setUpWithError() throws {
        try super.setUpWithError()
        view = MockView()
        persistenceController = PersistenceController.init(inMemory: true)
        context = persistenceController.container.viewContext
        presenter = NotesListPresenterImplementation(view: view, context: context)

        item = CDNotesModel(context: context)
        item.noteText = "TestText"
        item.noteTitle = "TestTitle"
        item.noteID = UUID()
        presenter.items = [item]
    }

    override func tearDownWithError() throws {
        view = nil
        presenter = nil
        persistenceController = nil
        super.tearDown()
    }

    func testViewDidLoad() {
        presenter.viewDidLoad()

        XCTAssertEqual(presenter.items.first, item)
        XCTAssertTrue(view.onNotesRetrievalCalled)
    }

    func testDeletion() throws {
        let indexPath = IndexPath(item: 0, section: 0)
        presenter.removeItem(item, index: indexPath)
        context.delete(item)
        XCTAssertEqual(presenter.items.count, 0)
        XCTAssertTrue(view.onNotesDeletionCalled)
        XCTAssertEqual(view.indexPathOnDeletion, indexPath)
    }

    func testTransition() throws {
        presenter.toTheDetailView(item)
//        XCTAssertTrue(view.)
    }
}

