//
//  NotesListViewController.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-04.
//

import UIKit

class NotesListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var createNoteButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func setupNoteButton() {
        if let createNoteButton = createNoteButton {
            createNoteButton.titleLabel?.text = "Add Note"
        }
    }

}

extension NotesListViewController: UITableViewDelegate {
    
}

extension NotesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell.init()
    }
    
    
}
