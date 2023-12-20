//
//  NotesCollectionViewCell.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-19.
//

import UIKit

class NotesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel?
    
    @IBOutlet weak var text: UILabel?
    
    func configureCell(_ note: CDNotesModel) {
        if let titleLabel = titleLabel {
            titleLabel.text = note.noteTitle
        }
        if let text = text {
            text.text = note.noteText
        }
    }
}

extension NotesCollectionViewCell: ReusableView {
    static var identifier: String {
        String(describing: self)
    }
}
