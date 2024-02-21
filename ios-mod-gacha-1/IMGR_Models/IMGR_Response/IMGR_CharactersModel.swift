//
//  IMGR_CharactersModel.swift
//  ios-mod-gacha-1
//
//  Created by Jack Flirenceon on 19.01.2024.
//

import Foundation
import CoreData

struct IMGR_CharactersModel: Codable {
    let list: [IMGR_Character]
    
    enum CodingKeys: String, CodingKey {
        case list = "jut_list"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.list = try container.decode([IMGR_Character].self, forKey: .list)
    }
}

struct IMGR_Character: Codable, IMGR_CoreDataConvertible {
    let id: Int
    let image: String
    let new: Bool
    let top: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "bjhiio0", image = "tgrh", new = "new", top = "top"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.image = try container.decode(String.self, forKey: .image)
        self.new = try container.decode(Bool.self, forKey: .new)
        self.top = try container.decode(Bool.self, forKey: .top)
    }
    
    func convertToCoreDataEntity(in context: NSManagedObjectContext) -> IMGR_CharacterCD {
            let dataCD = IMGR_CharacterCD(context: context)
            dataCD.id = UUID()
            dataCD.image = self.image
            dataCD.new = self.new
            dataCD.top = self.top
            return dataCD
        }
}

