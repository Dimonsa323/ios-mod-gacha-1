//
//  IMGR_Mods.swift
//  ios-mod-gacha-1
//
//  Created by Jack Flirenceon on 19.01.2024.
//

import Foundation
import CoreData

protocol IMGR_CoreDataConvertible {
    associatedtype CoreDataEntity: NSManagedObject
    
    func convertToCoreDataEntity(in context: NSManagedObjectContext) -> CoreDataEntity
}

struct IMGR_JustList: Codable {
    let justList: [IMGR_ModsModel]
    
    enum IMGR_CodingKeys: String, CodingKey {
        case justList = "jut_list"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: IMGR_CodingKeys.self)
        self.justList = try container.decode([IMGR_ModsModel].self, forKey: .justList)
    }
}

struct IMGR_ModsModel: Codable, IMGR_CoreDataConvertible {
    let id: Int
    let name: String
    let image: String
    let description: String
    let filePath: String
    let new: Bool
    let top: Bool
    
    enum CodingKeys_MGN: String, CodingKey {
        case id = "bjhiio0"
        case name = "ghitryi6"
        case image = "tgrh"
        case description = "yu86"
        case new = "new"
        case top = "top"
        case filePath = "adfi5_"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_MGN.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.image = try container.decode(String.self, forKey: .image)
        self.description = try container.decode(String.self, forKey: .description)
        self.filePath = try container.decode(String.self, forKey: .filePath)
        self.new = try container.decode(Bool.self, forKey: .new)
        self.top = try container.decode(Bool.self, forKey: .top)
    }
    
    init(model: IMGR_ModsCD) {
        self.id = Int(model.id)
        self.name = model.name ?? ""
        self.image = model.image ?? ""
        self.description = model.descriptionCD ?? ""
        self.filePath = model.filePatch ?? ""
        self.new = model.new
        self.top = model.top
    }
    
    func convertToCoreDataEntity(in context: NSManagedObjectContext) -> IMGR_ModsCD {
            let dataCD = IMGR_ModsCD(context: context)
            dataCD.id = Int16(self.id)
            dataCD.name = self.name
            dataCD.image = self.image
            dataCD.descriptionCD = self.description
            dataCD.filePatch = self.filePath
            dataCD.new = self.new
            dataCD.top = self.top
            return dataCD
        }
}
