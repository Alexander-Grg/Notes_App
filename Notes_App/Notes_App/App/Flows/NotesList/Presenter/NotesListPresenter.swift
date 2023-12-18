//
//  NotesListPresenter.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-04.
//

import UIKit
import CoreData

protocol NotesView: AnyObject {
    func onNotesRetrieval()
    func onNoteDeletion()
}

protocol NotesListPresenter: AnyObject {
    var coordinator: MainCoordinator? { get }
    var items: [CDNotesModel] { get }
    init(view: NotesView)
    func removeItem(_ item: CDNotesModel)
    func viewDidLoad()
    func toTheDetailView(_ note: CDNotesModel)
}

final class NotesListPresenterImplementation: NotesListPresenter {
    weak var view: NotesView?
    weak var coordinator: MainCoordinator?
    let context = PersistenceController.shared.container.viewContext
    
    var items = [CDNotesModel]()
    
    required init(view: NotesView) {
        self.view = view
    }
    
    func viewDidLoad() {
        retrieveItems()
    }
    
    private func retrieveItems() {
        do {
            items = try context.fetch(CDNotesModel.fetchRequest())
            view?.onNotesRetrieval()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func removeItem(_ item: CDNotesModel) {
        context.delete(item)
        do {
            try context.save()
            print("Data saved successfully!")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        view?.onNoteDeletion()
    }
    
    func toTheDetailView(_ note: CDNotesModel) {
        coordinator?.toTheExactNoteDetail(note: note)
    }
}
