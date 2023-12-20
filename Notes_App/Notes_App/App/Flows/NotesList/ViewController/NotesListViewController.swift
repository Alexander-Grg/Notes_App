//
//  NotesListViewController.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-04.
//

import UIKit

class NotesListViewController: UIViewController, StoryBoarded {
    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet weak var tableView: UITableView?
    @IBAction func switchControl(_ sender: Any) {
        tableView?.isHidden.toggle()
        collectionView?.isHidden.toggle()
        DispatchQueue.main.async {
            self.tableView?.reloadData()
            self.collectionView?.reloadData()
        }
    }
    
    var addNoteButton = UIBarButtonItem()
    var presenter: NotesListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad()
    }
    
    private func configureUI() {
        self.tableView?.register(UINib(nibName: NotesTableViewCell.identifier,
                                       bundle: nil), forCellReuseIdentifier: NotesTableViewCell.identifier)
        let nib = UINib(nibName: NotesCollectionViewCell.identifier, bundle: nil)
        self.collectionView?.register(nib, forCellWithReuseIdentifier: NotesCollectionViewCell.identifier)
        self.collectionView?.isHidden = true
        self.setupNoteButton()
    }
    
    private func setupNoteButton() {
        addNoteButton = UIBarButtonItem(title: "Add Note",
                                        style: .plain, target: self, action: #selector(createNotePressed))
        self.navigationItem.rightBarButtonItem = addNoteButton
    }
}

extension NotesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let note = presenter.items[indexPath.row]
        presenter.toTheDetailView(note)
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        let item = presenter.items[indexPath.row]
        if editingStyle == .delete {
            presenter.removeItem(item, index: indexPath)
        }
    }
}

extension NotesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: NotesTableViewCell.identifier,
                                                               for: indexPath) as? NotesTableViewCell
        else { return UITableViewCell() }
        
        dequeuedCell.configureCell(note: presenter.items[indexPath.row])
        return dequeuedCell
    }
}

extension NotesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return presenter.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NotesCollectionViewCell.identifier, for: indexPath) as? NotesCollectionViewCell
        else { return UICollectionViewCell()}
        cell.configureCell(presenter.items[indexPath.row])
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }
}

extension NotesListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = presenter.items[indexPath.item]
        presenter.toTheDetailView(item)
    }
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemsAt indexPaths: [IndexPath], point: CGPoint) -> UIContextMenuConfiguration? {
        let configuration = UIContextMenuConfiguration(actionProvider:  { action in
            
            let deleteAction = UIAction(title: "Delete") { [weak self] _ in
                guard let self = self else { return }
                guard let indexPath = indexPaths.first else { return }
                let item = self.presenter.items[indexPath.item]
                presenter.removeItem(item, index: indexPath)
            }
            return UIMenu(title: "", children: [deleteAction])
        })
        return configuration
    }
}

extension NotesListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(20.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}


extension NotesListViewController: NotesView {
    
    func onNotesRetrieval() {
        DispatchQueue.main.async {
            self.tableView?.reloadData()
            self.collectionView?.reloadData()
        }
    }
    
    func onNoteDeletion(index: IndexPath) {
        self.tableView?.deleteRows(at: [index], with: .fade)
        self.collectionView?.deleteItems(at: [index])
        self.tableView?.reloadData()
        self.collectionView?.reloadData()
    }

    @objc func createNotePressed() {
        presenter.coordinator?.toTheNoteDetail()
    }
}

