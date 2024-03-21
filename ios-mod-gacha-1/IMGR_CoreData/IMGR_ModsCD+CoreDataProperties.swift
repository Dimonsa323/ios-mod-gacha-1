//
//  IMGR_ModsCD+CoreDataProperties.swift
//  ios-mod-gacha-1
//
//  Created by Дима Губеня on 21.03.2024.
//
//

import Foundation
import CoreData


extension IMGR_ModsCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IMGR_ModsCD> {
        return NSFetchRequest<IMGR_ModsCD>(entityName: "IMGR_ModsCD")
    }

    @NSManaged public var descriptionCD: String?
    @NSManaged public var filePatch: String?
    @NSManaged public var id: UUID?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var new: Bool
    @NSManaged public var top: Bool

}

extension IMGR_ModsCD : Identifiable {

}
