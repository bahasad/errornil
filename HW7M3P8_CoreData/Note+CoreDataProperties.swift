//
//  Note+CoreDataProperties.swift
//  HW7M3P8_CoreData
//
//  Created by Baha Sadyr on 10/23/24.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var date: Date?
    @NSManaged public var header: String?
    @NSManaged public var id: String?
    @NSManaged public var text: String?
    @NSManaged public var subtasks: NSSet?

}

// MARK: Generated accessors for subtasks
extension Note {

    @objc(addSubtasksObject:)
    @NSManaged public func addToSubtasks(_ value: Note)

    @objc(removeSubtasksObject:)
    @NSManaged public func removeFromSubtasks(_ value: Note)

    @objc(addSubtasks:)
    @NSManaged public func addToSubtasks(_ values: NSSet)

    @objc(removeSubtasks:)
    @NSManaged public func removeFromSubtasks(_ values: NSSet)

}

extension Note : Identifiable {

}
