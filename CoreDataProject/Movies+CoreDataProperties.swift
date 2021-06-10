//
//  Movies+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Arkasha Zuev on 10.06.2021.
//
//

import Foundation
import CoreData


extension Movies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movies> {
        return NSFetchRequest<Movies>(entityName: "Movies")
    }

    @NSManaged public var title: String!
    @NSManaged public var director: String
    @NSManaged public var year: Int16
    
    public var wrappedTitle: String {
        title ?? "Unknown Title"
    }

}

extension Movies : Identifiable {

}
