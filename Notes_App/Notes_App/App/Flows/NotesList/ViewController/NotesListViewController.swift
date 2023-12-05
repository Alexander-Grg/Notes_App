//
//  NotesListViewController.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-04.
//

import UIKit

class NotesListViewController: UIViewController, StoryBoarded {

    @IBOutlet weak var tableView: UITableView?
    var addNoteButton = UIBarButtonItem()
    
    weak var coordinator: MainCoordinator?
//    private let presenter: NotesListPresenterOutput
    
//    init(presenter: NotesListPresenterOutput) {
//        self.presenter = presenter
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    private func configureUI() {
        self.setupNoteButton()
    }
    
    private func setupNoteButton() {
        addNoteButton = UIBarButtonItem(title: "Add Note", style: .plain, target: self, action: #selector(createNotePressed))
        self.navigationItem.rightBarButtonItem = addNoteButton
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

extension NotesListViewController: NotesListPresenterInput {
    
    @objc func createNotePressed() {
        coordinator?.toTheNoteDetail()
    }
}
