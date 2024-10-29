//
//  Subtask+CoreDataClass.swift
//  HW7M3P8_CoreData
//
//  Created by Baha Sadyr on 10/23/24.
//
//

import Foundation
import CoreData

@objc(Subtask)
public class Subtask: NSManagedObject {

}

extension Subtask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Subtask> {
        return NSFetchRequest<Subtask>(entityName: "Subtask")
    }

    @NSManaged public var id: String?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var title: String?
    @NSManaged public var note: Note?

}

extension Subtask : Identifiable {

}
