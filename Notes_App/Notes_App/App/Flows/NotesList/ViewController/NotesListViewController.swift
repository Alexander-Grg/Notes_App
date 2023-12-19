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
    
    var presenter: NotesListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad()
    }
    
    private func configureUI() {
        self.tableView?.register(UINib(nibName: NotesTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: NotesTableViewCell.identifier)
        self.setupNoteButton()
     

    }
    
    private func setupNoteButton() {
        addNoteButton = UIBarButtonItem(title: "Add Note", style: .plain, target: self, action: #selector(createNotePressed))
        self.navigationItem.rightBarButtonItem = addNoteButton
    }

}

extension NotesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = presenter.items[indexPath.row]
        presenter.toTheDetailView(note)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let item = presenter.items[indexPath.row]
        if editingStyle == .delete {
            presenter.removeItem(item, index: indexPath)
        }
    }
}

extension NotesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: NotesTableViewCell.identifier,
                                                         for: indexPath) as? NotesTableViewCell
        else { return UITableViewCell() }

        dequeuedCell.configureCell(note: presenter.items[indexPath.row])
        return dequeuedCell
    }
}

extension NotesListViewController: NotesView {
    
    func onNotesRetrieval() {
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    
    func onNoteDeletion(index: IndexPath) {
            self.tableView?.reloadData()
    }
    
    
    @objc func createNotePressed() {
        presenter.coordinator?.toTheNoteDetail()
    }
}
