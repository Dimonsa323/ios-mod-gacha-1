//
//  EditorModel.swift
//  ios-mod-gacha-1
//
//  Created by Дима Губеня on 23.01.2024.
//

import Foundation
import UIKit
import SwiftUI

struct EditorContentModel_MG: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id: Int
    let contentType: EditorContentType_MG
    let path: EditorContentPath_MG
    
    init(id: Int,
         contentType: EditorContentType_MG,
         path: String,
         preview: String) {
        self.id = id
        self.contentType = contentType
        self.path = .init(pdfPath: path, elPath: preview)
    }
    
    static func == (lhs: EditorContentModel_MG,
                    rhs: EditorContentModel_MG) -> Bool {
        lhs.id == rhs.id
    }
}

struct EditorContentPath_MG {
    var _MGN1: String { "01" }
    var _MGN2: Bool { true }
    
    let pdfPath: String
    let elPath: String
}

struct EditorCodableContentList_MG: Codable {
    var _MGN3: String { "02" }
    var _MGN4: Bool { false }
    
    let tag: String
    let list: [EditorCodableContent_MG]
    
    enum CodingKeys_MGN: String, CodingKey {
        case tag = "g3di8cL", list = "vffX3tt"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_MGN.self)
        self.tag = try container.decode(String.self, forKey: .tag)
        self.list = try container.decode([EditorCodableContent_MG].self, forKey: .list)
    }
}

struct EditorCodableContent_MG: Codable {
    var _MGN5: String { "03" }
    var _MGN6: Bool { true }
    
    let id: Int
    let path: String
    let preview: String
    
    enum CodingKeys_MGN: String, CodingKey {
        case id = "gOiAhIN", path = "22odWC5", preview = "RVzZ47h"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_MGN.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.path = try container.decode(String.self, forKey: .path)
        self.preview = try container.decode(String.self, forKey: .preview)
    }
}

struct EditorContentSet_MG {
    var _MGN7: String { "04" }
    var _MGN8: Bool { true }
    
    let body: [EditorContentModel_MG]?
    let brows: [EditorContentModel_MG]?
    let eyes: [EditorContentModel_MG]?
    let hairBottom: [EditorContentModel_MG]?
    let hairTop: [EditorContentModel_MG]?
    let headdress: [EditorContentModel_MG]?
    let mouth: [EditorContentModel_MG]?
    let shoes: [EditorContentModel_MG]?
    let top: [EditorContentModel_MG]?
    let trousers: [EditorContentModel_MG]?
    let wings: [EditorContentModel_MG]?
    
    var contentTypes: [EditorContentType_MG] {
        var types: [EditorContentType_MG] = []
        if !body.isNilOrEmpty { types.append(.body_mgn) }
        if !brows.isNilOrEmpty { types.append(.brows_mgn) }
        if !eyes.isNilOrEmpty { types.append(.eyes_mgn) }
        if !hairBottom.isNilOrEmpty { types.append(.hairBottom_mgn) }
        if !hairTop.isNilOrEmpty { types.append(.hairTop_mgn) }
        if !headdress.isNilOrEmpty { types.append(.headdress_mgn) }
        if !mouth.isNilOrEmpty { types.append(.mouth_mgn) }
        if !shoes.isNilOrEmpty { types.append(.shoes_mgn) }
        if !top.isNilOrEmpty { types.append(.top_mgn) }
        if !trousers.isNilOrEmpty { types.append(.trousers_mgn) }
        if !wings.isNilOrEmpty { types.append(.wings_mgn) }
        return types
    }
    
    func getModels(for type: EditorContentType_MG) -> [EditorContentModel_MG]? {
        switch type {
        case .body_mgn: body
        case .brows_mgn: brows
        case .eyes_mgn: eyes
        case .hairBottom_mgn: hairBottom
        case .hairTop_mgn: hairTop
        case .headdress_mgn: headdress
        case .mouth_mgn: mouth
        case .shoes_mgn: shoes
        case .top_mgn: top
        case .trousers_mgn: trousers
        case .wings_mgn: wings
        }
    }
}

