//
//  IMGR_Codable+Ext.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 23.12.2023.
//

import Foundation

extension IMGR_Data {
    func IMGR_json(using encoder: JSONEncoder = .init(), options: JSONSerialization.ReadingOptions = []) throws -> [ String ] {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return try JSONSerialization.jsonObject(with: self, options: []) as? [String] ?? []
    }
}
