//
//  NotesDetailItemView.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-07.
//

import UIKit

class NotesDetailItemView: UIView, CustomViewProtocol {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var noteTitleText: UITextField?
    @IBOutlet weak var noteBodyText: UITextView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func configure(note: CDNotesModel) {
        self.noteTitleText?.text = note.noteTitle
        self.noteBodyText?.text = note.noteText
    }
}
