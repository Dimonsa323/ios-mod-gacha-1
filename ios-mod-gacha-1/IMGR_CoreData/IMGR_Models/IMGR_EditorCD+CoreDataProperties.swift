//
//  IMGR_EditorCD+CoreDataProperties.swift
//  ios-mod-gacha-1
//
//  Created by Дима Губеня on 21.02.2024.
//
//

import Foundation
import CoreData


extension IMGR_EditorCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IMGR_EditorCD> {
        return NSFetchRequest<IMGR_EditorCD>(entityName: "IMGR_EditorCD")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var path: String?
    @NSManaged public var preview: String?

}

extension IMGR_EditorCD : Identifiable {

}
