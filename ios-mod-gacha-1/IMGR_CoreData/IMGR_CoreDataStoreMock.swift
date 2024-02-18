//
//  IMGR_CoreDataStoreMock.swift
//  ios-mod-gacha-1
//
//  Created by Дима Губеня on 15.02.2024.
//

import CoreData
import UIKit

class IMGR_CoreDataStoreMock {
    
    static let description: String = "Discover how you can create and customize your unique Gacha characters and enjoy various engaging activities, including dress-up, battles, and studio mode. Explore the fascinating and fun-fuelled world with other players and interact with them through joyful methods. Intrigued mini-games with creative styles and tremendous rewards for players to fully immerse and explore everything. Collect more pets in the activities and show off their combinations in fashion or related topics with eye-catching outfits. Battle with other players for extreme fun while earning rewards to progress further in the career."
    
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
    
    @discardableResult
    static func IMGR_createMods(with moc: NSManagedObjectContext) -> [IMGR_ModsCD] {
        
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        
        let objectsCD = (1...20).map { index in
            let object = IMGR_ModsCD(context: moc)
            object.name = "Gacha Club"
            object.descriptionCD = description
            object.id = UUID()
            object.image = "mods/1.jpg"
            object.filePatch = "aha-world-mod.apk"
            object.new = false
            object.top = true
        //    object.uuid = UUID()
         
            
            return object
        }
        return objectsCD
    }
    
    @discardableResult
    static func IMGR_createCharacters(with moc: NSManagedObjectContext) -> [IMGR_CharacterCD] {
        
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        
        let objectsCD = (1...20).map { index in
            let object = IMGR_CharacterCD(context: moc)
            object.id = 1
            object.image = "characters/1chi.jpg"
            object.new = false
            object.top = true
            
            return object
        }
        return objectsCD
    }
    
    @discardableResult
    static func IMGR_createOutfit(with moc: NSManagedObjectContext) -> [IMGR_OutfitIdeaCD] {
        
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        
        let objectsCD = (1...20).map { index in
            let object = IMGR_OutfitIdeaCD(context: moc)
            object.id = 1
            object.image = "OutfitIdeas/1.jpg"
            object.new = false
            object.top = true
            
            return object
        }
        return objectsCD
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
            object.id = 1
            object.image = "wallpapers/1.jpg"
            object.newWall = false
            object.top = true
            
            return object
        }
        return objectsCD
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
        
        let objectsCD = (1...20).map { index in
            let object = IMGR_MiniGameCD(context: moc)
            object.name = "Character Creation"
            object.id = UUID()
            object.gameplay = description
            object.image = "MiniGames/1.jpg"
            object.new = false
            object.top = true
            
            return object
        }
        return objectsCD
    }
    
    @discardableResult
    static func IMGR_createCollections(with moc: NSManagedObjectContext) -> [IMGR_CollectionsCD] {
        
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        
        let objectsCD = (1...20).map { index in
            let object = IMGR_CollectionsCD(context: moc)
            object.id = 1
            object.image = "MiniGames/1.jpg"
            object.new = false
            object.top = true
            
            return object
        }
        return objectsCD
    }
}
