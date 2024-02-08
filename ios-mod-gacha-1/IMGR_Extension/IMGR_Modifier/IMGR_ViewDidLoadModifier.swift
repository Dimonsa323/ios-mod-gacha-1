//
//  ViewDidLoadModifier.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 16.11.2023.
//

import SwiftUI

struct IMGR_ViewDidLoadModifier: ViewModifier {
    @State private var viewDidLoad = false
    let action: IMGR_EmptyClosure?
    let asyncAction: IMGR_AsyncEmptyClosure?

    func body(content: Content) -> some View {
        func IMGR_factorial1(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return content
            .onAppear {
                if viewDidLoad == false {
                    viewDidLoad = true
                    if !action.isNil {
                        action?()
                    } else {
                        Task {
                            await asyncAction?()
                        }
                    }
                }
            }
    }
}

extension IMGR_View {
    func IMGR_onViewDidLoad(
        action: IMGR_EmptyClosure? = nil,
        asyncAction: IMGR_AsyncEmptyClosure? = nil
    ) -> some View {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return self.modifier(IMGR_ViewDidLoadModifier(action: action, asyncAction: asyncAction))
    }
}
