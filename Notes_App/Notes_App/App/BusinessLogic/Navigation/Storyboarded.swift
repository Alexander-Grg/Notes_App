//
//  Storyboarded.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-05.
//

import UIKit

protocol StoryBoarded {
    static func instantiate() -> Self
}

extension StoryBoarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        // swiftlint:disable force_cast
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
        // swiftlint:enable force_cast
    }
}
