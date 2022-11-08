//
//  Task+CoreDataClass.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 06.11.2022.
//
//

import Foundation
import CoreData

@objc(Task)
public class Task: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.instatnce.entityForName(entityName: "Task"), insertInto: CoreDataManager.instatnce.context)
    }
    
    
    
}
