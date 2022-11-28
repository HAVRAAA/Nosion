//
//  Task+CoreDataClass.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 28.11.2022.
//
//

import Foundation
import CoreData

@objc(Task)
public class Task: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.shared.entityForName(entityName: "Task"), insertInto: CoreDataManager.shared.context)
    }
}