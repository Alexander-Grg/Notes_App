//
//  NotesTableViewCell.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-04.
//

import UIKit

class NotesTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!

    func configureCell(note: CDNotesModel) {
        guard let noteTitle = note.noteTitle,
              let noteText = note.noteText
        else { return }

        if noteTitle.isEmpty {
            title.text = "New note"
        } else {
            title.text = noteTitle
        }

        if noteText.isEmpty {
            subTitle.text = "No additional text"
            subTitle.textAlignment = .center
        } else {
            subTitle.text = noteText
        }
    }
}


extension NotesTableViewCell: ReusableView {
    static var identifier: String {
        String(describing: self)
    }
}
