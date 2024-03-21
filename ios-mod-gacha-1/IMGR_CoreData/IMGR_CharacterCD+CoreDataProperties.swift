//
//  IMGR_CharacterCD+CoreDataProperties.swift
//  ios-mod-gacha-1
//
//  Created by Дима Губеня on 21.03.2024.
//
//

import Foundation
import CoreData


extension IMGR_CharacterCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IMGR_CharacterCD> {
        return NSFetchRequest<IMGR_CharacterCD>(entityName: "IMGR_CharacterCD")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var image: String?
    @NSManaged public var new: Bool
    @NSManaged public var top: Bool
    @NSManaged public var name: String?

}

extension IMGR_CharacterCD : Identifiable {

}
