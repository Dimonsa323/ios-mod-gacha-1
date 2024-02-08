//
//  HomeDataAPI_IMGR.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 11.12.2023.
//

import Foundation
import Resolver
import HYSLogger

class IMGR_HomeDataAPI {
    func generateRandomPlaceholder(length: Int) -> String {
        let allCharacters: String = ""
        for _ in 1...length {
            let randomIndex = Int.random(in: 0..<allCharacters.count)
            let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
        }
        return allCharacters
    }
    @Injected private var dropBoxManager: IMGR_Dropbox
    @Injected private var coreDataStore: IMGR_CoreDataStore
}

// MARK: - API Methods
extension IMGR_HomeDataAPI {
    func IMGR_getModels(type: IMGR_ContentType) async throws {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        
        let size = try await dropBoxManager.IMGR_getMetaData(type: type)
        
        guard size != UserDefaults.standard.integer(forKey: "bytes\(type.rawValue)") else {
                    Logger.debug("\(type.rawValue) already getted")
                    return
                }
        
        switch type {
        case .mods:
            let mods: IMGR_JustList = try await dropBoxManager.IMGR_downloadModel(filePath: type.downloadPath, modelType: IMGR_JustList.self)
            await saveModels(type: type, json: mods.justList)
        case .wallpapers:
            let wallpapers: IMGR_WallpapersListCodable = try await dropBoxManager.IMGR_downloadModel(filePath: type.downloadPath, modelType: IMGR_WallpapersListCodable.self)
            await saveModels(type: type, json: wallpapers.list)
        case .miniGames:
            let miniGames: IMGR_MiniGamesModel = try await dropBoxManager.IMGR_downloadModel(filePath: type.downloadPath, modelType: IMGR_MiniGamesModel.self)
            await saveModels(type: type, json: miniGames.list)
        case .characters:
            let character: IMGR_CharactersModel = try await dropBoxManager.IMGR_downloadModel(filePath: type.downloadPath, modelType: IMGR_CharactersModel.self)
            await saveModels(type: type, json: character.list)
        case .outfitIdea:
            let outfitIdeas: IMGR_OutfitIdeasListCodable = try await dropBoxManager.IMGR_downloadModel(filePath: type.downloadPath, modelType: IMGR_OutfitIdeasListCodable.self)
            await saveModels(type: type, json: outfitIdeas.list)
        case .collections:
            let collections: IMGR_CollectionsModel = try await dropBoxManager.IMGR_downloadModel(filePath: type.downloadPath, modelType: IMGR_CollectionsModel.self)
            await saveModels(type: type, json: collections.list)
        case .home:
            break
        case .settings:
            break
        case .editor:
            break
        }
        
        UserDefaults.standard.set(Int(size), forKey: "bytes\(type.rawValue)")
        
        Logger.debug("\(type.rawValue) get success")
    }
}

// MARK: - CoreData methods
extension IMGR_HomeDataAPI {
    private func saveModels<T: IMGR_CoreDataConvertible>(type: IMGR_ContentType, json: [T]) async {
        await coreDataStore.viewContext.perform {
            for object in json {
                let dataCD = object.convertToCoreDataEntity(in: self.coreDataStore.viewContext)
            }
            
            do {
                try self.coreDataStore.IMGR_saveChanges()
                print("Data from the internet successfully saved to CoreData for \(type.rawValue) - \(json)")
                Logger.debug("\(type.rawValue) write to CoreData success")
            } catch {
                Logger.error("Failed to save changes to CoreData: \(error)")
            }
        }
    }
}
