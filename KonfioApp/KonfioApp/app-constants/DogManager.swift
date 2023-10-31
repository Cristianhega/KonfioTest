//
//  DogManager.swift
//  KonfioApp
//
//  Created by Cristian Hernandez Garcia on 31/10/23.
//

import Foundation
import CoreData

class DogManager {
    let context = CoreDataStack.shared.persistentContainer.viewContext

    func hasDataInCoreData() -> Bool {
        let fetchRequest: NSFetchRequest<DogEntity> = DogEntity.fetchRequest()

        do {
            let count = try context.count(for: fetchRequest)
            return count > .zero
        } catch {
            print("Error counting DogEntity: \(error.localizedDescription)")
            return false
        }
    }

    func getDogsFromCoreData() -> [Dog] {
        do {
            let fetchRequest: NSFetchRequest<DogEntity> = DogEntity.fetchRequest()
            let dogEntities = try context.fetch(fetchRequest)
            let dogs: [Dog] = dogEntities.compactMap { dogEntity in
                guard let dogName = dogEntity.dogName,
                      let description = dogEntity.descrip,
                      let age = Int(exactly: dogEntity.age),
                      let image = dogEntity.image else {
                    return nil
                }

                let dog = Dog(dogName: dogName, description: description, age: Int(age), image: image)
                return dog
            }
            return dogs
        } catch {
            print("Error al extraer datos de Core Data: \(error)")
        }
        return []
    }

    func saveDogsFromService(dogs: [Dog]) {
        for dog in dogs {
            let dogEntity = DogEntity(context: context)
            dogEntity.dogName = dog.dogName
            dogEntity.descrip = dog.description
            dogEntity.age = Int16(dog.age ?? .zero)
            dogEntity.image = dog.image
        }

        do {
            try context.save()
        } catch {
            print("Error saving to Core Data: \(error.localizedDescription)")
        }
    }
}

class CoreDataStack {
    static let shared = CoreDataStack()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: Constants.dogs)
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        })
        return container
    }()

    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    private init() {}
}
