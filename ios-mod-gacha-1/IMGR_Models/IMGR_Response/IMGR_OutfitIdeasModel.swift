//
//  IMGR_sdfds.swift
//  ios-mod-gacha-1
//
//  Created by Jack Flirenceon on 19.01.2024.
//

import Foundation
import CoreData

//struct IMGR_OutfitIdeasModel: Codable {
//    let response: IMGR_OutfitIdeasListCodable
//    
//    enum CodingKeys_MGN: String, CodingKey {
//        case response = "gh_34s_list"
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.response = try container.decode(IMGR_OutfitIdeasListCodable.self, forKey: .response)
//    }
//}

struct IMGR_OutfitIdeasListCodable: Codable {
    let list: [IMGR_OutfitIdea]
    
    enum CodingKeys: String, CodingKey {
        case list = "jut_list"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.list = try container.decode([IMGR_OutfitIdea].self, forKey: .list)
    }
}

struct IMGR_OutfitIdea: Codable, IMGR_CoreDataConvertible {
    let id: Int
    let image: String
    let new: Bool
    let top: Bool
    let name: String
    
    var favId: Int { id }
    var searchText: String? { nil }
    
    enum CodingKeys: String, CodingKey {
        case id = "bjhiio0"
        case image = "tgrh"
        case new = "new"
        case top = "top"
        case name = "ghitryi6"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.image = try container.decode(String.self, forKey: .image)
        self.new = try container.decode(Bool.self, forKey: .new)
        self.top = try container.decode(Bool.self, forKey: .top)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    func convertToCoreDataEntity(in context: NSManagedObjectContext) -> IMGR_OutfitIdeaCD {
            let dataCD = IMGR_OutfitIdeaCD(context: context)
            dataCD.id = UUID()
            dataCD.image = self.image
            dataCD.new = self.new
            dataCD.top = self.top
            dataCD.name = self.name
            return dataCD
        }
}
