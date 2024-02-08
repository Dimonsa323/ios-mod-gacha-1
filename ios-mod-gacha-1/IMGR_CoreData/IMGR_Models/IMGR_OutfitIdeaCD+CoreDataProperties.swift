//
//  IMGR_OutfitIdeaCD+CoreDataProperties.swift
//  ios-mod-gacha-1
//
//  Created by Дима Губеня on 08.02.2024.
//
//

import Foundation
import CoreData


extension IMGR_OutfitIdeaCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IMGR_OutfitIdeaCD> {
        return NSFetchRequest<IMGR_OutfitIdeaCD>(entityName: "IMGR_OutfitIdeaCD")
    }

    @NSManaged public var id: Int16
    @NSManaged public var image: String?
    @NSManaged public var new: Bool
    @NSManaged public var top: Bool

}

extension IMGR_OutfitIdeaCD : Identifiable {

}
