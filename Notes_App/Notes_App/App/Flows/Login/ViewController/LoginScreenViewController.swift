//
//  LoginScreenViewController.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-04.
//

import UIKit
import CoreData

class LoginScreenViewController: UIViewController, StoryBoarded {

    @IBOutlet weak var welcomingText: UILabel?
    @IBOutlet weak var enterButton: UIButton?
    @IBAction func enterButton(_ sender: Any) {
        self.coordinator?.toTheNotesList(context: PersistenceController.shared.container.viewContext)
    }

    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }

    private func configureUI() {
        self.configureWelcomingText()
        self.configureEnterButton()
    }

    private func configureWelcomingText() {
        if let welcomingText = welcomingText {
            welcomingText.text = "WELCOME!"
        }
    }

    private func configureEnterButton() {
        if let enterButton = enterButton {
            let title = "Start using Notes"
            enterButton.setTitle(title, for: .normal)
        }
    }
}
