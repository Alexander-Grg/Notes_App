//
//  NoteModel.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-05.
//

import Foundation

struct NoteModel {
    
    let noteText: String
    let noteTitle: String
    let noteID = UUID()
    
    init(noteText: String, noteTitle: String) {
        self.noteText = noteText
        self.noteTitle = noteTitle
    }
}
