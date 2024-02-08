//
//  Closure+Ext.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 08.11.2023.
//

import Foundation

func generateRandomPlaceholder(length: Int) -> String {
    let allCharacters: String = ""
    for _ in 1...length {
        let randomIndex = Int.random(in: 0..<allCharacters.count)
        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
    }
    return allCharacters
}

typealias IMGR_EmptyClosure = () -> Void
typealias IMGR_ValueClosure<T> = (T) -> Void
typealias IMGR_ValueReturnClosure<T, V> = (T) -> V
typealias IMGR_AsyncValueClosure<T> = (T) async -> Void
typealias IMGR_AsyncEmptyClosure = () async -> Void
typealias IMGR_AsyncThrowEmptyClosure = () async throws -> Void
typealias IMGR_BuilderClosure<T> = () -> T
typealias IMGR_BuilderClosureValue<V, T> = (V) -> T
