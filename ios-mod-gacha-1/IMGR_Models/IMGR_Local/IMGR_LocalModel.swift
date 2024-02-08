//
//  IMGR_LocalModel.swift
//  ios-mod-gacha-1
//
//  Created by Дима Губеня on 05.02.2024.
//

import Foundation

enum IMGR_ModelType: String {
    
    case justList
    case wallpapersList
    case miniGames
    case characters
    case outfitIdeasList
    case collections
    
    var downloadPatch: String {
        switch self {
        case .justList:
            return "/mods/mods.json"
        case .wallpapersList:
            return "/wallpapers/wallpapers.json"
        case .miniGames:
            return "/minigames/minigames.json"
        case .characters:
            return "/characters/characters.json"
        case .outfitIdeasList:
            return "/outfitIdeas/outfitideas.json"
        case .collections:
            return "/collections/collections.json"
        }
    }
}
