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
    
    weak var coordinator: MainCoordinator?
    var notes: [NoteModel] = []
    
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
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension NotesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: NotesTableViewCell.identifier,
                                                         for: indexPath) as? NotesTableViewCell
        else { return UITableViewCell() }

        dequeuedCell.configureCell(note: self.notes[indexPath.row])
        return dequeuedCell
    }
    
    
}

extension NotesListViewController: NotesView {
    
    func onNotesRetrieval(notes: [NoteModel]) {
        self.notes = notes
        self.tableView?.reloadData()
    }
    
    func onNoteAddSuccess(note: NoteModel) {
        self.notes.append(note)
        self.tableView?.reloadData()
    }
    
    func onNoteAddFailure(message: String) {
        print("View failed to receive data from the Presenter - \(message)")
    }
    
    func onNoteDeletion(index: Int) {
        self.notes.remove(at: index)
        self.tableView?.reloadData()
    }
    
    
    @objc func createNotePressed() {
        coordinator?.toTheNoteDetail()
    }
}
