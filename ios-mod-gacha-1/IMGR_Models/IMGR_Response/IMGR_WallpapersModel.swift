//
//  IMGR_WallpapersModel.swift
//  ios-mod-gacha-1
//
//  Created by Jack Flirenceon on 19.01.2024.
//

import Foundation
import CoreData

//struct IMGR_WallpapersResponseCodable: Codable {
//    let response: IMGR_WallpapersListCodable
//    
//    enum CodingKeys: String, CodingKey {
//        case response = "gkn_2a_list"
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.response = try container.decode(IMGR_WallpapersListCodable.self, forKey: .response)
//    }
//}

struct IMGR_WallpapersListCodable: Codable {
    let list: [IMGR_Wallpaper]
    
    enum CodingKeys: String, CodingKey {
        case list = "jut_list"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.list = try container.decode([IMGR_Wallpaper].self, forKey: .list)
    }
}

struct IMGR_Wallpaper: Codable, IMGR_CoreDataConvertible {
    let newWall: Bool
    let id: Int
    let image: String
    let top: Bool
    
    enum CodingKeys: String, CodingKey {
        case newWall = "new"
        case image = "tgrh"
        case id = "bjhiio0"
        case top = "top"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.newWall = try container.decode(Bool.self, forKey: .newWall)
        self.image = try container.decode(String.self, forKey: .image)
        self.id = try container.decode(Int.self, forKey: .id)
        self.top = try container.decode(Bool.self, forKey: .top)
    }
    
    func convertToCoreDataEntity(in context: NSManagedObjectContext) -> IMGR_WallpaperCD {
            let dataCD = IMGR_WallpaperCD(context: context)
            dataCD.id = UUID()
            dataCD.image = self.image
            dataCD.newWall = self.newWall
            dataCD.top = self.top
            return dataCD
        }
}
