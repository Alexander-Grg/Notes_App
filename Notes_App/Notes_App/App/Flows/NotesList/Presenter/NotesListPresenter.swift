//
//  NotesListPresenter.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-04.
//

import UIKit

protocol NotesListPresenterInput: AnyObject {
}

protocol NotesListPresenterOutput: AnyObject {
}

final class NotesListPresenter {
        
    weak var viewInput: (UIViewController & NotesListPresenterInput)?

    private func toNotesDetailScreen() {

    }
    
}

extension NotesListPresenter: NotesListPresenterOutput {
    
}
