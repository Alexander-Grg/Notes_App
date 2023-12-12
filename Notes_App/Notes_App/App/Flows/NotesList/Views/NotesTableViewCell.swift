//
//  NotesTableViewCell.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-04.
//

import UIKit

class NotesTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel?
    @IBOutlet weak var subTitle: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(note: NoteModel) {
        if let title = title {
            title.text = note.noteTitle
        }
        
        if let subTitle = subTitle {
            subTitle.text = note.noteText
        }
    }
    
}

extension NotesTableViewCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
