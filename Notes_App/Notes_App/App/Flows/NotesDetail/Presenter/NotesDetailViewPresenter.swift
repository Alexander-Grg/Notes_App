//
//  NotesDetailViewPresenter.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-07.
//

import UIKit

protocol NotesDetailView: AnyObject {
    func onNotesRetrieval(notes: [NoteModel])
    func onNoteAddSuccess(note: NoteModel)
    func onNoteAddFailure(message: String)
    func onNoteDeletion(index: Int)
    var mainView: NotesDetailItemView? { get set }
}

protocol NotesDetailViewPresenter: AnyObject {
    init(view: NotesDetailView)
    func addNote()
}

final class NotesDetailViewPresenterImplementation: NotesDetailViewPresenter {
    
    weak var view: NotesDetailView?
    
    required init(view: NotesDetailView) {
        self.view = view
    }
    
    func addNote() {
        guard let titleText = view?.mainView?.noteTitleText?.text,
              let bodyText = view?.mainView?.noteBodyText?.text,
              
              !titleText.isEmpty,
              !bodyText.isEmpty
        else { return }
        
        let note = NoteModel(noteTitle: titleText, noteText: bodyText)
        
        TestSingleton.instance.notes.append(note)
    }
    
    
}

//protocol NotesDetailViewPresenterInput: AnyObject {
//    var mainView: NotesDetailItemView? { get }
//}
//
//protocol NotesDetailViewPresenterOutput: AnyObject {
//    func createNote()
//}
//
//final class NotesDetailViewPresenter {
//    
//    weak var viewInput: (UIViewController & NotesDetailViewPresenterInput)?
//    
//    internal func createNote() {
//        guard   let titleText = viewInput?.mainView?.noteTitleText?.text,
//                let bodyText = viewInput?.mainView?.noteBodyText?.text,
//                !titleText.isEmpty,
//                !bodyText.isEmpty
//        else { return }
//        
//        let note = NoteModel(noteTitle: titleText, noteText: bodyText)
//        
//        TestSingleton.instance.notes.append(note)
//    }
//    
// 
//    
//}
//
//extension NotesDetailViewPresenter: NotesDetailViewPresenterOutput {
//    
//}
