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
        presenter.openNote()
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
        guard let oldNoteText = mainView?.noteBodyText?.text,
              let oldNoteTitle = mainView?.noteTitleText?.text else { return }
        
        if presenter.note != nil {
            presenter.editNote(newTitle: oldNoteTitle, newText: oldNoteText)
        } else {
            presenter.addNote()
        }
    }
}

extension NotesDetailViewController: NotesDetailView {

    func onNoteAddSuccess(_ alert: UIAlertController) {
        self.present(alert, animated: true)
    }
}
