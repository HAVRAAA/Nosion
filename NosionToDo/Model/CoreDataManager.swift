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
    
    
    // MARK: ADD
    func user(nameParam: String, passwordParam: String) -> User {
        let user = User(context: context)
        user.name = nameParam
        user.password = passwordParam
        return user
    }
    
    func task(taskParam: String, userParam: User) -> Task {
        let task = Task(context: context)
        task.task = taskParam
        task.done = false
        userParam.addToTask(task)
        return task
    }
    
    
    
    
    // MARK: DELETE
    
    func deleteTask(task: Task) {
        let context = persistentContainer.viewContext
        context.delete(task)
        saveContext()
    }
    
    func deleteUser(user: User) {
        let context = persistentContainer.viewContext
        context.delete(user)
        saveContext()
    }
    
    
    func users() -> [User] {
        let request: NSFetchRequest<User> = User.fetchRequest()
        var fetchedUsers: [User] = []
        
        do {
            fetchedUsers = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("Error fetching users \(error)")
        }
        return fetchedUsers
    }
    
    func tasks(user: User) -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.predicate = NSPredicate(format: "user = %@", user)
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        var fetchedTasks: [Task] = []
        
        do {
            fetchedTasks = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("Error fetching songs \(error)")
        }
        return fetchedTasks
    }
    
    
    
    
    
    
}

