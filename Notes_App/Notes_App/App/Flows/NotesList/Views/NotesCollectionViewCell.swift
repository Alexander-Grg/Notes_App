//
//  NotesCollectionViewCell.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-19.
//

import UIKit

class NotesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var text: UILabel!

    func configureCell(_ note: CDNotesModel) {
        guard let noteTitle = note.noteTitle,
              let noteText = note.noteText
        else { return }

        if noteTitle.isEmpty {
            titleLabel.text = "New note"
        } else {
            titleLabel.text = noteTitle
        }

        if noteText.isEmpty {
            text.text = "No additional text"
            text.textAlignment = .center
        } else {
            text.text = noteText
            text.textAlignment = .left
        }
    }
}

extension NotesCollectionViewCell: ReusableView {
    static var identifier: String {
        String(describing: self)
    }
}
