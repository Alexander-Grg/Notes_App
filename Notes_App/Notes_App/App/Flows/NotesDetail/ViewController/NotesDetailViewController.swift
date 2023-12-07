//
//  NotesDetailViewController.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-05.
//

import UIKit

class NotesDetailViewController: UIViewController, StoryBoarded {
    
    @IBOutlet var mainView: NotesDetailItemView?
    
//    private let presenter: NotesDetailViewPresenterOutput
    weak var coordinator: MainCoordinator?
    
//    init(presenter: NotesDetailViewPresenterOutput) {
//        self.presenter = presenter
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    private func configureUI() {
        
    }
    
    private func createSaveNoteButton() {
        let button = UIBarButtonItem(title: "Save note", style: .plain, target: self, action: #selector(tapSave))
        self.navigationItem.rightBarButtonItem = button
    }
    
    @objc func tapSave() {
        presenter.createNote()
    }
}

extension NotesDetailViewController: NotesDetailViewPresenterInput {
    
}
