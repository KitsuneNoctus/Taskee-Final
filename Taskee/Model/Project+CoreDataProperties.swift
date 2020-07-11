//
//  Project+CoreDataProperties.swift
//  Taskee
//
//  Created by Henry Calderon on 7/10/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//
//

import Foundation
import CoreData


extension Project {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project")
    }

    @NSManaged public var color: Double
    @NSManaged public var title: String?
    @NSManaged public var newRelationship: Task?

}
