//
//  MainCoordinatorTest.swift
//  Notes_AppTests
//
//  Created by Alexander Grigoryev on 2024-01-11.
//

import XCTest
import CoreData
@testable import Notes_App

final class MainCoordinatorTest: XCTestCase {

    var navController: UINavigationController!
    var coordinator: MainCoordinator!
    var view: NotesDetailItemView!
    var persistenseController: PersistenceController!
    var context: NSManagedObjectContext!
    var note: CDNotesModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        navController = UINavigationController()
        coordinator = MainCoordinator(navigationController: navController)
        view = NotesDetailItemView()
        persistenseController = PersistenceController(inMemory: true)
        context = persistenseController.container.viewContext
        note = CDNotesModel(context: context)
        note.noteText = "Test"
        note.noteTitle = "TestTitle"
        note.noteID = UUID()
        try persistenseController.save()
    }

    override func tearDownWithError() throws {
        navController = nil
        coordinator = nil
        view = nil
        persistenseController = nil
        context = nil
        note = nil
        try super.tearDownWithError()
    }

    func testToTheNotesListTransition() async throws {
        coordinator.toTheNotesList(context: context)
        await coordinator.navigationController.topViewController is NotesListViewController
        await MainActor.run {
            XCTAssertTrue(coordinator.navigationController.topViewController is NotesListViewController)
        }
    }

    func testToTheNotesDetailTransition() async throws {
        coordinator.toTheNoteDetail()
        await coordinator.navigationController.topViewController is NotesDetailViewController
        await MainActor.run {
            XCTAssertTrue(coordinator.navigationController.topViewController is NotesDetailViewController)
        }
    }

    func testToTheExactNoteTransition() async throws {
        coordinator.start()
        await coordinator.navigationController.topViewController is LoginScreenViewController
        coordinator.toTheNotesList(context: context)
        await coordinator.navigationController.topViewController is NotesListViewController
        coordinator.toTheExactNoteDetail(note: note)
        await coordinator.navigationController.topViewController is NotesDetailViewController

        await MainActor.run {
            XCTAssert(coordinator.navigationController.topViewController is NotesDetailViewController)
        }
    }
}

