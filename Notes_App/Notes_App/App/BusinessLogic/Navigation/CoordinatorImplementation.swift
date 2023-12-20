//
//  CoordinatorImplementation.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-05.
//

import UIKit

 class MainCoordinator: Coordinator {

    var childCoordinators = [Coordinator]()

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

     func start() {
         let viewController = LoginScreenViewController.instantiate()
         viewController.coordinator = self
         navigationController.pushViewController(viewController, animated: false)
     }

     func toTheNotesList() {
         let viewController = NotesListViewController.instantiate()
         let presenter = NotesListPresenterImplementation(view: viewController)
         viewController.presenter = presenter
         presenter.coordinator = self
         navigationController.pushViewController(viewController, animated: true)
         
     }

     func toTheNoteDetail() {
         let viewController = NotesDetailViewController.instantiate()
         let presenter = NotesDetailViewPresenterImplementation(view: viewController)
         viewController.presenter = presenter
         presenter.coordinator = self
         navigationController.pushViewController(viewController, animated: true)
     }

     func toTheExactNoteDetail(note: CDNotesModel) {
         let viewController = NotesDetailViewController.instantiate()
         let presenter = NotesDetailViewPresenterImplementation(view: viewController, note: note)
         viewController.presenter = presenter
         presenter.coordinator = self
         navigationController.pushViewController(viewController, animated: true)
     }
}
