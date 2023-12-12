//
//  NotesListPresenter.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-04.
//

import UIKit

protocol NotesView: AnyObject {
    func onNotesRetrieval(notes: [NoteModel])
    func onNoteAddSuccess(note: NoteModel)
    func onNoteAddFailure(message: String)
    func onNoteDeletion(index: Int)
}

protocol NotesListPresenter: AnyObject {
    init(view: NotesView)
    func viewDidLoad()
}

final class NotesListPresenterImplementation: NotesListPresenter {
    
    weak var view: NotesView?
    private var items = TestSingleton.instance.notes
    
    required init(view: NotesView) {
        self.view = view
    }
    
    func viewDidLoad() {
        retrieveItems()
    }
    
    private func retrieveItems() {
        view?.onNotesRetrieval(notes: self.items)
    }
    
    
}

//final class NotesListPresenter: Not
