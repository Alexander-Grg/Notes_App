//
//  EmptyNotesView.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-05.
//

import UIKit

class EmptyNotesView: UIView {
    
    private(set) lazy var emptyNotesTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text  = "There is no notes yet"
        
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        self.addSubview(emptyNotesTitle)
        
        NSLayoutConstraint.activate([
            emptyNotesTitle.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            emptyNotesTitle.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
}
