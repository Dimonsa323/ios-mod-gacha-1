//
//  IMGR_WallpaperCD+CoreDataProperties.swift
//  ios-mod-gacha-1
//
//  Created by Дима Губеня on 08.02.2024.
//
//

import Foundation
import CoreData


extension IMGR_WallpaperCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IMGR_WallpaperCD> {
        return NSFetchRequest<IMGR_WallpaperCD>(entityName: "IMGR_WallpaperCD")
    }

    @NSManaged public var id: Int16
    @NSManaged public var image: String?
    @NSManaged public var newWall: Bool
    @NSManaged public var top: Bool

}

extension IMGR_WallpaperCD : Identifiable {

}
