//
//  User+CoreDataClass.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 28.11.2022.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.shared.entityForName(entityName: "User"), insertInto: CoreDataManager.shared.context)
    }
}
