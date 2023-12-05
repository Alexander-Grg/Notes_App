//
//  Coordinator.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-05.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
