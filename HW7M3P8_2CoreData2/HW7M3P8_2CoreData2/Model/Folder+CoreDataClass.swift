//
//  Folder+CoreDataClass.swift
//  HW7M3P8_2CoreData2
//
//  Created by Baha Sadyr on 10/28/24.
//
//

import Foundation
import CoreData

@objc(Folder)
public class Folder: NSManagedObject {

}

extension Folder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Folder> {
        return NSFetchRequest<Folder>(entityName: "Folder")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: String?
    @NSManaged public var name: String?

}

extension Folder : Identifiable {

}

