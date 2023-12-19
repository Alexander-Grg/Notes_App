//
//  NoteModel.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-05.
//

import Foundation

struct NoteModel {
    let noteTitle: String
    let noteText: String
    let noteID = UUID()

    init(noteTitle: String, noteText: String) {
        self.noteTitle = noteTitle
        self.noteText = noteText
    }
}
