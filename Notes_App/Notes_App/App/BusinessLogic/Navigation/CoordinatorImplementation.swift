//
//  CoordinatorImplementation.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-05.
//

import UIKit
import CoreData

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        DispatchQueue.main.async {
            let viewController = LoginScreenViewController.instantiate()
            viewController.coordinator = self
            self.navigationController.pushViewController(viewController, animated: false)
        }
        
    }
    
    func toTheNotesList(context: NSManagedObjectContext) {
        DispatchQueue.main.async {
            let viewController = NotesListViewController.instantiate()
            let presenter = NotesListPresenterImplementation(view: viewController,
                                                             context: context)
            viewController.presenter = presenter
            presenter.coordinator = self
            self.navigationController.pushViewController(viewController, animated: true)
        }
    }
    
    func toTheNoteDetail() {
        DispatchQueue.main.async {
            let viewController = NotesDetailViewController.instantiate()
            let presenter = NotesDetailViewPresenterImplementation(view: viewController)
            viewController.presenter = presenter
            presenter.coordinator = self
            self.navigationController.pushViewController(viewController, animated: true)
        }
    }
    
    func toTheExactNoteDetail(note: CDNotesModel) {
        DispatchQueue.main.async {
            let viewController = NotesDetailViewController.instantiate()
            let presenter = NotesDetailViewPresenterImplementation(view: viewController, note: note)
            viewController.presenter = presenter
            presenter.coordinator = self
            self.navigationController.pushViewController(viewController, animated: true)
        }
    }
}
