//
//  NotesDetailViewController.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-05.
//

import UIKit

class NotesDetailViewController: UIViewController, StoryBoarded {
    
    @IBOutlet var mainView: NotesDetailItemView?
    
    weak var coordinator: MainCoordinator?
    
    var presenter: NotesDetailViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        // Do any additional setup after loading the view.
    }
    
    private func configureUI() {
        self.createSaveNoteButton()
    }
    
    private func createSaveNoteButton() {
        let button = UIBarButtonItem(title: "Save note", style: .plain, target: self, action: #selector(tapSave))
        self.navigationItem.rightBarButtonItem = button
    }
    
    @objc func tapSave() {
        presenter.addNote()
    }
}

extension NotesDetailViewController: NotesDetailView {

    func onNotesRetrieval(notes: [NoteModel]) {
        
    }
    
    func onNoteAddSuccess(note: NoteModel) {
        
    }
    
    func onNoteAddFailure(message: String) {
        
    }
    
    func onNoteDeletion(index: Int) {
        
    }

}
