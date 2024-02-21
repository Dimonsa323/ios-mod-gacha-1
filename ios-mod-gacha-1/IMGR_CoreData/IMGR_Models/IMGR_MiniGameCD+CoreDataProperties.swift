//
//  IMGR_MiniGameCD+CoreDataProperties.swift
//  ios-mod-gacha-1
//
//  Created by Дима Губеня on 21.02.2024.
//
//

import Foundation
import CoreData


extension IMGR_MiniGameCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IMGR_MiniGameCD> {
        return NSFetchRequest<IMGR_MiniGameCD>(entityName: "IMGR_MiniGameCD")
    }

    @NSManaged public var gameplay: String?
    @NSManaged public var id: UUID?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var new: Bool
    @NSManaged public var top: Bool

}

extension IMGR_MiniGameCD : Identifiable {

}
