//
//  CDNotesModel+CoreDataProperties.swift
//  Notes_App
//
//  Created by Alexander Grigoryev on 2023-12-16.
//
//

import Foundation
import CoreData


extension CDNotesModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDNotesModel> {
        return NSFetchRequest<CDNotesModel>(entityName: "CDNotesModel")
    }

    @NSManaged public var noteID: UUID?
    @NSManaged public var noteText: String?
    @NSManaged public var noteTitle: String?

}

extension CDNotesModel : Identifiable {

}
