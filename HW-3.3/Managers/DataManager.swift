//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Виталий Подшибякин on 22.05.2022.
//


import CoreData

class DataManager {
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UserModel")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    let viewContext: NSManagedObjectContext

    init() {
        viewContext = persistentContainer.viewContext
    }
    
    
    func fetchData(completion: (Result<[User], Error>) -> Void) {
        let fetchRequest = User.fetchRequest()
        
        do {
            let user = try viewContext.fetch(fetchRequest)
            completion(.success(user))
        } catch let error {
            completion(.failure(error))
        }
    }

    func save(_ userName: String, _ isRegistered: Bool, completion: (User) -> Void) {
        let user = User(context: viewContext)
        user.isUserRegistered = true
        user.name = userName
        completion(user)
        saveContext()
    }

    func delete(_ user: User, _ isRegistered: Bool) {
        viewContext.delete(user)
        user.isUserRegistered = false
        saveContext()
    }


    // MARK: - Core Data Saving support
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
