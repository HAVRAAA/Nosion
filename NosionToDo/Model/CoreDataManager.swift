//
//  CoreDataManager.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 01.11.2022.
//

import Foundation
import CoreData



class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    // Створюємо для того, щоб не повторювати постійно той код
    lazy var context: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()
    
    // Опис сущності
    func entityForName(entityName: String) -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: entityName, in: context)!
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CoreDataDemo")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    
    // MARK: SAVE CONTEXT
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: CREATE
    
    func user(name: String, password: String) -> User {
        let user = User(context: context)
        user.name = name
        user.password = password
        return user
    }
    
    func task(title: String, user: User) -> Task {
        let task = Task(context: context)
        task.title = title
        task.status = false
        user.addToTask(task)
        return task
    }
    
    
    
    
    
}

