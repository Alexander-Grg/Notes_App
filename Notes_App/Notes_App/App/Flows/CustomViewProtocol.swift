//
//  CustomViewProtocol.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-07.
//

import UIKit

protocol CustomViewProtocol {
    var contentView: UIView! { get }

    func commonInit()
}

extension CustomViewProtocol where Self: UIView {
    func commonInit() {
        let name = NSStringFromClass(type(of: self))
        let viewName = name.components(separatedBy: ".")[1]
        Bundle.main.loadNibNamed(viewName, owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
