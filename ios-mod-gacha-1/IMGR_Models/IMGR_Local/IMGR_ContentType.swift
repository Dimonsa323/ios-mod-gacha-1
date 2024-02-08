//
//  IMGR_ContentType.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 22.12.2023.
//

import Foundation

enum IMGR_ContentType: String, CaseIterable, Identifiable {
    var id: Self { self }
    
    case mods = "mods"
    case outfitIdea = "outfitIdeas"
    case collections = "collections"
    case miniGames = "minigames"
    case wallpapers = "wallpapers"
    case characters = "characters"
    case home = "Home"
    case settings = "Settings"
    case editor = "editor"

    static var tabBar: [IMGR_ContentType] = [.home, .characters, .miniGames, .settings]
    static var apiMenus: [IMGR_ContentType] = [.mods, .wallpapers, .miniGames, .characters, .outfitIdea, .collections, .editor]
    
    // model type
    
//    var modelType: Codable.Type? {
//        switch self {
//        case .mods: return IMGR_ModsModel.self
//        case .outfitIdea: return IMGR_OutfitIdea.self
//        case .collections: return IMGR_Collections.self
//        case .miniGames: return IMGR_MiniGame.self
//        case .wallpapers: return IMGR_Wallpaper.self
//        case .characters: return IMGR_Character.self
//        case .home: return nil
//        case .settings: return nil
//        case .editor: return nil
//        }
//    }

    // paths to json file
    var downloadPath: String {
        switch self {
        case .mods: return "/mods/mods.json"
        case .collections: return "/collections/collections.json"
        case .wallpapers: return "/wallpapers/wallpapers.json"
        case .characters: return "/characters/characters.json"
        case .outfitIdea: return "/outfitIdeas/outfitideas.json"
        case .editor: return "/editor/editor.json"
        case .miniGames: return "/minigames/minigames.json"
        default:
            return ""
        }
    }
         
//    var folderName: String {
//        switch self{
//        case .mods:
//            return "Mods"
//        case .skins:
//            return "Skins"
//            
//            return "Buildings"
//        default: return ""
//        }
//    }

    var image: ImageResource? {
        switch self {
        case .mods:
            return .tabBarHome
        case .characters:
            return .tabBarPerson
        case .miniGames:
            return .tabBarGames
        case .settings:
            return .tabBarSetting
        case .outfitIdea, .collections, .wallpapers, .home, .editor:
            return nil
        }
    }

//    var entityName: String {
//        switch self {
//        case .mods:
//            return "IMGR_ModsMO"
//        case .skins:
//            return "IMGR_SkinsMO"
//        case .category:
//            return "IMGR_CategoriesMO"
//        case .editor:
//            return "IMGR_EditorMO"
//        default:
//            return ""
//        }
//    }
}
