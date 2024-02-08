//
//  IMGR_CollectionsModel.swift
//  ios-mod-gacha-1
//
//  Created by Jack Flirenceon on 19.01.2024.
//

import Foundation
import CoreData

struct IMGR_CollectionsModel: Codable {
    let list: [IMGR_Collections]
    
    enum CodingKeys_MGN: String, CodingKey {
        case list = "jut_list"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_MGN.self)
        self.list = try container.decode([IMGR_Collections].self, forKey: .list)
    }
}

struct IMGR_Collections: Codable, IMGR_CoreDataConvertible {
    let id: Int
    let image: String
    let new: Bool
    let top: Bool
    
    var favId: Int { id }
    var searchText: String? { nil }
    
    enum CodingKeys_MGN: String, CodingKey {
        case id = "bjhiio0"
        case image = "tgrh"
        case new = "new"
        case top = "top"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_MGN.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.image = try container.decode(String.self, forKey: .image)
        self.new = try container.decode(Bool.self, forKey: .new)
        self.top = try container.decode(Bool.self, forKey: .top)
    }
    
    func convertToCoreDataEntity(in context: NSManagedObjectContext) -> IMGR_CollectionsCD {
            let dataCD = IMGR_CollectionsCD(context: context)
            dataCD.id = Int16(self.id)
            dataCD.image = self.image
            dataCD.new = self.new
            dataCD.top = self.top
            return dataCD
        }
}


