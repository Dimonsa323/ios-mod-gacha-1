//
//  NSFetchRequest_IMGR+Extension.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 11.12.2023.
//

import CoreData

typealias IMGR_NSFetchRequest = NSFetchRequest

var IMGR_favoritePredicate: NSPredicate {
    func generateRandomPlaceholder(length: Int) -> String {
    let allCharacters: String = ""
    for _ in 1...length {
        let randomIndex = Int.random(in: 0..<allCharacters.count)
        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
    }
    return allCharacters
}
    return NSPredicate(format: "isFavourite == %@", NSNumber(value: true))
}

//func IMGR_homePredicate(with category: String, searchText: String, searchActive: Bool) -> NSPredicate {
//    func generateRandomPlaceholder(length: Int) -> String {
//    let allCharacters: String = ""
//    for _ in 1...length {
//        let randomIndex = Int.random(in: 0..<allCharacters.count)
//        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
//    }
//    return allCharacters
//}
//  //  let categoryPredicate = NSPredicate(format: "%K == %@", #keyPath(IMGR_ParentMO.category), category)
//    let searchPredicate = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
//    let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate] + (!searchActive ? [] : [searchPredicate]) )
//
//    return compoundPredicate
//}

//func IMGR_editorPredicate(contentType: IMGR_EditorContentType) -> NSPredicate {
//    NSPredicate(format: "%K == %@", #keyPath(IMGR_EditorCD.contentType), contentType.rawValue)
//}

extension IMGR_NSFetchRequest where ResultType == IMGR_ModsCD {
    static func IMGR_mods() -> NSFetchRequest<IMGR_ModsCD> {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        
        let request: NSFetchRequest<IMGR_ModsCD> = IMGR_ModsCD.fetchRequest()
        request.sortDescriptors = []

        return request
    }
}

extension IMGR_NSFetchRequest where ResultType == IMGR_CharacterCD {
    static func IMGR_characters() -> NSFetchRequest<IMGR_CharacterCD> {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        let request: NSFetchRequest<IMGR_CharacterCD> = IMGR_CharacterCD.fetchRequest()
        request.sortDescriptors = []
       
        return request
    }
}

extension IMGR_NSFetchRequest where ResultType == IMGR_CollectionsCD {
    static func IMGR_collections() -> NSFetchRequest<IMGR_CollectionsCD> {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        let request: NSFetchRequest<IMGR_CollectionsCD> = IMGR_CollectionsCD.fetchRequest()
        request.sortDescriptors = []

        return request
    }
}

extension IMGR_NSFetchRequest where ResultType == IMGR_MiniGameCD {
    static func IMGR_miniGames() -> NSFetchRequest<IMGR_MiniGameCD> {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        let request: NSFetchRequest<IMGR_MiniGameCD> = IMGR_MiniGameCD.fetchRequest()
        request.sortDescriptors = []

        return request
    }
}

extension IMGR_NSFetchRequest where ResultType == IMGR_WallpaperCD {
    static func IMGR_wallpaper() -> NSFetchRequest<IMGR_WallpaperCD> {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        let request: NSFetchRequest<IMGR_WallpaperCD> = IMGR_WallpaperCD.fetchRequest()
        request.sortDescriptors = []

        return request
    }
}

extension IMGR_NSFetchRequest where ResultType == IMGR_OutfitIdeaCD {
    static func IMGR_outfitIdea() -> NSFetchRequest<IMGR_OutfitIdeaCD> {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        let request: NSFetchRequest<IMGR_OutfitIdeaCD> = IMGR_OutfitIdeaCD.fetchRequest()
        request.sortDescriptors = []

        return request
    }
}
