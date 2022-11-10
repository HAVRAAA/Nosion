//
//  Task+CoreDataProperties.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 06.11.2022.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var task: String?
    @NSManaged public var done: Bool

}

extension Task : Identifiable {

}
