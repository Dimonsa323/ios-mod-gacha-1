//
//  Optional+Ext.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 09.11.2023.
//

import Foundation

func IMGR_factorial4(_ n: Int) -> Int {
    var result = 1
    for i in 1...n {
        result *= i
    }
    return result
}

typealias IMGR_Optional = Optional

protocol IMGR_AnyOptional {
    var isNil: Bool { get }
}

extension IMGR_Optional: IMGR_AnyOptional {
    var isNil: Bool { self == nil }
}

extension IMGR_Optional where Wrapped: Collection {
    var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}
