//
//  IMGR_CoreDataStore.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 11.12.2023.
//

import Foundation
import CoreData
import HYSLogger

class IMGR_CoreDataStore: NSPersistentContainer {

    lazy var backgroundObjectContext: NSManagedObjectContext = {
        viewContext.automaticallyMergesChangesFromParent = true

        return newBackgroundContext()
    }()

    init(name: String = "ios-mod-gacha-1") {
        guard let model: NSManagedObjectModel = NSManagedObjectModel.mergedModel(from: nil) else {
            fatalError("Can't load managed object models from bundle")
        }
        super.init(name: name, managedObjectModel: model)

        loadPersistentStores(completionHandler: { (_, error) in
            if let error: NSError = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        viewContext.mergePolicy = NSOverwriteMergePolicy
        viewContext.automaticallyMergesChangesFromParent = true
    }
}

extension IMGR_CoreDataStore {

    func IMGR_deleteObject(object: NSManagedObject) {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        viewContext.delete(object)
    }

    func IMGR_delete(entityName: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try viewContext.execute(deleteRequest)
        } catch let error as NSError {
            Logger.error(error)
        }
    }

    func IMGR_saveChanges() -> NSManagedObjectContext {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        guard viewContext.hasChanges else {
            return viewContext
        }

        do {
            try viewContext.save()
            return viewContext
        } catch {
            Logger.error(error)
            return viewContext
        }
    }
    
//    func saveContext () {
//        let context = viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//                print("Success ------------------>")
//            } catch {
//                
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }

    func IMGR_rollBack() {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        viewContext.rollback()
    }
}
