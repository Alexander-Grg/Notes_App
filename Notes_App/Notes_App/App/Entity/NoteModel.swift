//
//  NoteModel.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-05.
//

import Foundation

final class TestSingleton {
    static public let instance = TestSingleton()
    var notes: [NoteModel] = []

    private init() {}
}

struct NoteModel {
    
    let noteTitle: String
    let noteText: String
    let noteID = UUID()
    static let mock = NoteModel(noteTitle: "SomeTitle", noteText: "TestTextTestTestTextTestTestTextTestTestTextTestTestTextTestTestTextTestTestTextTestTestTextTestTestTextTestTestTextTestTestTextTestTestTextTestTestTextTestTestTextTest")
    
    init(noteTitle: String, noteText: String) {
        self.noteTitle = noteTitle
        self.noteText = noteText
    }
}
