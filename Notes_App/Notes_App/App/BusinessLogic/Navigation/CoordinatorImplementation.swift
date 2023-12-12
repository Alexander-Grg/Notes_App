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
         let vc = LoginScreenViewController.instantiate()
         vc.coordinator = self
         navigationController.pushViewController(vc, animated: false)
     }
     
     func toTheNotesList() {
         let vc = NotesListViewController.instantiate()
         let presenter = NotesListPresenterImplementation(view: vc)
         vc.presenter = presenter
         vc.coordinator = self
         navigationController.pushViewController(vc, animated: true)
     }
     
     func toTheNoteDetail() {
         let vc = NotesDetailViewController.instantiate()
         let presenter = NotesDetailViewPresenterImplementation(view: vc)
         vc.presenter = presenter
         vc.coordinator = self
         navigationController.pushViewController(vc, animated: true)
     }
}
