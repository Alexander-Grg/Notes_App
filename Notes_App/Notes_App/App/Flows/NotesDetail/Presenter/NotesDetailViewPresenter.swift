//
//  NotesDetailViewPresenter.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-07.
//

import UIKit
import CoreData

protocol NotesDetailView: AnyObject {
    func onNoteAddSuccess(_ alert: UIAlertController)
    var mainView: NotesDetailItemView? { get set }
}

protocol NotesDetailViewPresenter: AnyObject {
    init(view: NotesDetailView)
    var coordinator: MainCoordinator? { get }
    var note: CDNotesModel? { get set }
    func editNote(newTitle: String, newText: String)
    func addNote()
    func openNote()
}

final class NotesDetailViewPresenterImplementation: NotesDetailViewPresenter {
    let context = PersistenceController.shared.container.viewContext
    weak var coordinator: MainCoordinator?
    weak var view: NotesDetailView?
    var note: CDNotesModel?

    required init(view: NotesDetailView) {
        self.view = view
    }

    convenience init(view: NotesDetailView, note: CDNotesModel?) {
        self.init(view: view)
        self.note = note
    }

    func addNote() {
        guard let titleText = view?.mainView?.noteTitleText?.text,
              let bodyText = view?.mainView?.noteBodyText?.text
        else { return }

        let note = CDNotesModel(context: context)
        note.noteTitle = titleText
        note.noteText = bodyText

        do {
            try context.save()
            print("Data saved successfully!")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        self.addAlertOfSavedNote()
    }

    func openNote() {
        guard let note = note
        else { return }

        if let mainView = view?.mainView {
            mainView.noteTitleText?.text = note.noteTitle
            mainView.noteBodyText?.text = note.noteText
        }

    }

    func editNote(newTitle: String, newText: String) {
        guard let newNote = note else { return }
        newNote.noteTitle = newTitle
        newNote.noteText = newText
        do {
            try context.save()
            print("Data saved successfully!")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        self.addAlertOfEditedNote()
    }

    func addAlertOfSavedNote() {
        let alert = UIAlertController(title: "Success", message: "The note is saved", preferredStyle: .alert)
        let action = UIAlertAction(title: "Cool!", style: .cancel)
        alert.addAction(action)

        view?.onNoteAddSuccess(alert)
    }

    func addAlertOfEditedNote() {
        let alert = UIAlertController(title: "Success", message: "The note is updated", preferredStyle: .alert)
        let action = UIAlertAction(title: "Cool!", style: .cancel)
        alert.addAction(action)

        view?.onNoteAddSuccess(alert)
    }
}
