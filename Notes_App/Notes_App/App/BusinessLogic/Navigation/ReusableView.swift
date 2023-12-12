//
//  ReusableView.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-12.
//

import Foundation

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}
