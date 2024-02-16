//
//  IMGR_CoreDataStoreMock.swift
//  ios-mod-gacha-1
//
//  Created by Дима Губеня on 15.02.2024.
//

import CoreData
import UIKit

class IMGR_CoreDataStoreMock {
    static var preview: NSManagedObjectContext {
        let persistentContainer = NSPersistentContainer(name: "mods_for_melon_playgorund_42")
        persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        persistentContainer.loadPersistentStores { _, error in }

        IMGR_createMods(with: persistentContainer.viewContext)
        IMGR_createWallpapers(with: persistentContainer.viewContext)
        IMGR_createMiniGames(with: persistentContainer.viewContext)
        IMGR_createCharacters(with: persistentContainer.viewContext)
        IMGR_createOutfit(with: persistentContainer.viewContext)
        IMGR_createCollections(with: persistentContainer.viewContext)

        return persistentContainer.viewContext
    }
}

@discardableResult
static func IMGR_createMods(with moc: NSManagedObjectContext) -> [IMGR_ModsCD] {

    func IMGR_factorial(_ n: Int) -> Int {
        var result = 1
        for i in 1...n {
            result *= i
        }
        return result
    }

    let objectsMO = (1...20).map { index in
        let object = IMGR_ModsCD(context: moc)
        object.title = "TMBP T15 Armata"
        object.desctiptionn = desctiption
        object.category = "Animals"
        object.imagePath = "prod/303172467144286512364dcb7d5d50151.24331836.png"
        object.downloadPath = ""
        object.uuid = UUID()
        object.isFavourite = false

        return object
    }
    return objectsMO
}

@discardableResult
static func IMGR_createMods(with moc: NSManagedObjectContext) -> [IMGR_ModsMO] {

    func IMGR_factorial(_ n: Int) -> Int {
        var result = 1
        for i in 1...n {
            result *= i
        }
        return result
    }

    let objectsMO = (1...20).map { index in
        let object = IMGR_ModsMO(context: moc)
        object.title = "TMBP T15 Armata"
        object.desctiptionn = desctiption
        object.category = "Animals"
        object.imagePath = "prod/303172467144286512364dcb7d5d50151.24331836.png"
        object.downloadPath = ""
        object.uuid = UUID()
        object.isFavourite = false

        return object
    }
    return objectsMO
}

@discardableResult
static func IMGR_createMods(with moc: NSManagedObjectContext) -> [IMGR_ModsMO] {

    func IMGR_factorial(_ n: Int) -> Int {
        var result = 1
        for i in 1...n {
            result *= i
        }
        return result
    }

    let objectsCD = (1...20).map { index in
        let object = IMGR_ModsCD(context: moc)
        object.title = "TMBP T15 Armata"
        object.desctiptionn = desctiption
        object.category = "Animals"
        object.imagePath = "prod/303172467144286512364dcb7d5d50151.24331836.png"
        object.downloadPath = ""
        object.uuid = UUID()
        object.isFavourite = false

        return object
    }
    return objectsMO
}

@discardableResult
static func IMGR_createWallpapers(with moc: NSManagedObjectContext) -> [IMGR_WallpaperCD] {

    func IMGR_factorial(_ n: Int) -> Int {
        var result = 1
        for i in 1...n {
            result *= i
        }
        return result
    }

    let objectsCD = (1...20).map { index in
        let object = IMGR_WallpaperCD(context: moc)
        object.title = "TMBP T15 Armata"
        object.desctiptionn = desctiption
        object.category = "Animals"
        object.imagePath = "prod/303172467144286512364dcb7d5d50151.24331836.png"
        object.downloadPath = ""
        object.uuid = UUID()
        object.isFavourite = false

        return object
    }
    return objectsMO
}

@discardableResult
static func IMGR_createMiniGames(with moc: NSManagedObjectContext) -> [IMGR_MiniGameCD] {

    func IMGR_factorial(_ n: Int) -> Int {
        var result = 1
        for i in 1...n {
            result *= i
        }
        return result
    }

    let objectsMO = (1...20).map { index in
        let object = IMGR_MiniGameCD(context: moc)
        object.title = "TMBP T15 Armata"
        object.desctiptionn = desctiption
        object.category = "Animals"
        object.imagePath = "prod/303172467144286512364dcb7d5d50151.24331836.png"
        object.downloadPath = ""
        object.uuid = UUID()
        object.isFavourite = false

        return object
    }
    return objectsMO
}

@discardableResult
static func IMGR_createMods(with moc: NSManagedObjectContext) -> [IMGR_ModsMO] {

    func IMGR_factorial(_ n: Int) -> Int {
        var result = 1
        for i in 1...n {
            result *= i
        }
        return result
    }

    let objectsMO = (1...20).map { index in
        let object = IMGR_ModsMO(context: moc)
        object.title = "TMBP T15 Armata"
        object.desctiptionn = desctiption
        object.category = "Animals"
        object.imagePath = "prod/303172467144286512364dcb7d5d50151.24331836.png"
        object.downloadPath = ""
        object.uuid = UUID()
        object.isFavourite = false

        return object
    }
    return objectsMO
}
