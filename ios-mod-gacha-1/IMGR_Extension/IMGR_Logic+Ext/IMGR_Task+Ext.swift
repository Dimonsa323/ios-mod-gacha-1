//
//  Task+Ext.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 16.11.2023.
//

import Foundation

typealias IMGR_Task = Task

extension IMGR_Task where Success == Never, Failure == Never {
    static func IMGR_sleep(seconds: Double) async {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        let duration = UInt64(seconds * 1_000_000_000)
        try? await Task.sleep(nanoseconds: duration)
    }
}
