//
//  CustomSheet.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 16.11.2023.
//

import SwiftUI

typealias IMGR_EnvironmentValues = EnvironmentValues

struct IMGR_CreateSheetAction {
    typealias Action = IMGR_ValueClosure<IMGR_CustomSheetModel?>
    let action: Action
    func callAsFunction(_ note: IMGR_CustomSheetModel?) {
        action(note)
    }
}

struct IMGR_CreateSheetActionKey: EnvironmentKey {
    static var defaultValue: IMGR_CreateSheetAction?
}

extension IMGR_EnvironmentValues {
    var IMGR_createSheet: IMGR_CreateSheetAction? {
        get { self[IMGR_CreateSheetActionKey.self] }
        set { self[IMGR_CreateSheetActionKey.self] = newValue }
    }
}

extension IMGR_View {
    func IMGR_onCreateSheet(_ action: @escaping IMGR_CreateSheetAction.Action) -> some View {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return self.environment(\.IMGR_createSheet, IMGR_CreateSheetAction(action: action))
    }
}
