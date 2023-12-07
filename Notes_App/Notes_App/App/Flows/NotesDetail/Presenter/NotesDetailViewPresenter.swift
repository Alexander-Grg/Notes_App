//
//  NotesDetailViewPresenter.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-07.
//

import UIKit

protocol NotesDetailViewPresenterInput: AnyObject {
    var mainView: NotesDetailItemView? { get }
}

protocol NotesDetailViewPresenterOutput: AnyObject {
    func createNote()
}

final class NotesDetailViewPresenter {
    
    weak var viewInput: (UIViewController & NotesDetailViewPresenterInput)?
    
    internal func createNote() {
        guard   let titleText = viewInput?.mainView?.noteTitleText?.text,
                let bodyText = viewInput?.mainView?.noteBodyText?.text,
                !titleText.isEmpty,
                !bodyText.isEmpty
        else { return }
        
        let note = NoteModel(noteTitle: titleText, noteText: bodyText)
        
        TestSingleton.instance.notes.append(note)
    }
    
 
    
}

extension NotesDetailViewPresenter: NotesDetailViewPresenterOutput {
    
}
