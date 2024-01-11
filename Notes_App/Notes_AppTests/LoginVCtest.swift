//
//  LoginVCtest.swift
//  Notes_AppTests
//
//  Created by Alexander Grigoryev on 2023-12-22.
//

import XCTest
@testable import Notes_App
import CoreData

final class LoginVCtest: XCTestCase {

    var viewController: LoginScreenViewController!
    var coordinator: MockCoordinator!
    var navController: UINavigationController!
    var context: NSManagedObjectContext!

    override func setUpWithError() throws {
        navController = UINavigationController()
        context = PersistenceController(inMemory: true).container.viewContext
        viewController = LoginScreenViewController.instantiate()
        coordinator = MockCoordinator(navigationController: navController)
        viewController.coordinator = coordinator
        viewController.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        viewController = nil
        coordinator = nil
        navController = nil
        context = nil
        super.tearDown()

    }

    func testWelcomeText() throws {
        guard let text = viewController.welcomingText?.text else { throw XCTestError(.failureWhileWaiting) }
        XCTAssertEqual(text, "WELCOME!")
    }

    func testEnterButton() throws {
        XCTAssertEqual(viewController.enterButton?.title(for: .normal), "Start using Notes")
    }

    func testToTheNextScreen() throws {
        viewController.coordinator?.toTheNotesList(context: context)
        XCTAssertTrue(coordinator.toTheNotesListCalled)
    }

    func testAction() throws {
        viewController.enterButton(self)
        XCTAssertTrue(coordinator.toTheNotesListCalled)
    }
}

class MockCoordinator: MainCoordinator {
    var toTheNotesListCalled = false

    override func toTheNotesList(context: NSManagedObjectContext) {
        toTheNotesListCalled = true
    }
}


