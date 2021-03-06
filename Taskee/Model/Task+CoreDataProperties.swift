//
//  Task+CoreDataProperties.swift
//  Taskee
//
//  Created by Henry Calderon on 7/10/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var duedate: Date?
    @NSManaged public var status: Bool
    @NSManaged public var title: String?
    @NSManaged public var newRelationship: NSSet?

}

// MARK: Generated accessors for newRelationship
extension Task {

    @objc(addNewRelationshipObject:)
    @NSManaged public func addToNewRelationship(_ value: Project)

    @objc(removeNewRelationshipObject:)
    @NSManaged public func removeFromNewRelationship(_ value: Project)

    @objc(addNewRelationship:)
    @NSManaged public func addToNewRelationship(_ values: NSSet)

    @objc(removeNewRelationship:)
    @NSManaged public func removeFromNewRelationship(_ values: NSSet)

}
