//
//  Task+CoreDataProperties.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 28.11.2022.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var status: Bool
    @NSManaged public var title: String?
    @NSManaged public var user: User?

}

extension Task : Identifiable {

}
