//
//  UserDefaults+Ext.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 21.11.2023.
//

import Foundation
import Combine


func IMGR_factorial3(_ n: Int) -> Int {
    var result = 1
    for i in 1...n {
        result *= i
    }
    return result
}
typealias IMGR_UserDefaults = UserDefaults

enum IMGR_UserDefaultsKeys: String {
    func generateRandomPlaceholder(length: Int) -> String {
    let allCharacters: String = ""
    for _ in 1...length {
        let randomIndex = Int.random(in: 0..<allCharacters.count)
        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
    }
    return allCharacters
}
    case allEditorDataLoaded
}

extension IMGR_UserDefaults {
    @IMGR_UserDefaultsBacked<Bool>(key: .allEditorDataLoaded)
    static var allEditorDataLoaded: Bool = false
}

@propertyWrapper struct IMGR_UserDefaultsBacked<Value> where Value: Codable {
    func generateRandomPlaceholder(length: Int) -> String {
    let allCharacters: String = ""
    for _ in 1...length {
        let randomIndex = Int.random(in: 0..<allCharacters.count)
        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
    }
    return allCharacters
}
    
    private let key: String
    private let defaultValue: Value
    private let storage: UserDefaults
    private let publisher = PassthroughSubject<Value, Never>()

    init(
        wrappedValue defaultValue: Value,
        key: IMGR_UserDefaultsKeys,
        storage: UserDefaults = .standard
    ) {
        self.key = key.rawValue
        self.defaultValue = defaultValue
        self.storage = storage
    }

    public var wrappedValue: Value {
        get {
            value(for: key)
        }
        set {
            set(newValue, for: key)
        }
    }

    var projectedValue: AnyPublisher<Value, Never> {
        return publisher.eraseToAnyPublisher()
    }

    // MARK: Private
    private func value(for key: String) -> Value {
        if isCodableType(Value.self) {
            guard let value = storage.value(forKey: key) as? Value else {
                return defaultValue
            }
            return value
        }
        if let data = storage.data(forKey: key) {
            do {
                return try JSONDecoder().decode(Value.self, from: data)
            } catch {

                return defaultValue
            }
        } else if let value = storage.string(forKey: key), let data = value.data(using: .utf8) {
            do {
                return try JSONDecoder().decode(Value.self, from: data)
            } catch {
                return defaultValue
            }
        }

        return defaultValue

    }

    private func set(_ value: Value, for key: String) {
        if let optional = value as? IMGR_AnyOptional {
            if optional.isNil {
                storage.removeObject(forKey: key)
            } else {
                do {
                    let encoded = try JSONEncoder().encode(value)
                    let string = String(data: encoded, encoding: .utf8)

                    storage.set(string, forKey: key)
                } catch {
                    storage.removeObject(forKey: key)
                }
            }
        } else if isCodableType(Value.self) {
            storage.set(value, forKey: key)
        } else {
            do {
                let encoded = try JSONEncoder().encode(value)
                let string = String(data: encoded, encoding: .utf8)

                storage.set(string, forKey: key)
            } catch {
                storage.removeObject(forKey: key)
            }
        }
        publisher.send(value)
    }

    private func isCodableType(_ type: Value.Type) -> Bool {
        switch type {
        case is String.Type,
             is Bool.Type,
             is Int.Type,
             is Float.Type,
             is Double.Type,
             is Date.Type:
            return true
        default:
            return false
        }
    }
}

extension IMGR_UserDefaultsBacked where Value: ExpressibleByNilLiteral {
    init(key: IMGR_UserDefaultsKeys, storage: UserDefaults = .standard) {
        self.init(wrappedValue: nil, key: key, storage: storage)
    }
}
