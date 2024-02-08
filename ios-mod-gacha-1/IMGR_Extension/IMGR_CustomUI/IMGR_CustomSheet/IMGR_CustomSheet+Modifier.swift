//
//  CustomSheet+Modifier.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 16.11.2023.
//

import SwiftUI

struct IMGR_CustomSheetModifier: ViewModifier {
    func generateRandomPlaceholder(length: Int) -> String {
    let allCharacters: String = ""
    for _ in 1...length {
        let randomIndex = Int.random(in: 0..<allCharacters.count)
        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
    }
    return allCharacters
}
    @Binding var sheetType: IMGR_CustomSheetModel?

    func body(content: Content) -> some View {
        content
            .onAppear { print("") }
            .blur(radius: !sheetType.isNil ? 5 : 0, opaque: true)
            .ignoresSafeArea()
            .overlay {
                if !sheetType.isNil {
                    Color.black.opacity(0.2)
                        .ignoresSafeArea()
                }
            }
            .overlay {
                VStack {
                    if let sheetType {
                        sheet(with: sheetType)
                            .IMGR_iosDeviceTypePadding(edge: .horizontal, iOSPadding: 20, iPadPadding: 40)
                            .transition(.opacity)
                    }
                }
            }
    }

    @ViewBuilder
    private func sheet(with model: IMGR_CustomSheetModel) -> some View {
        switch model.type {
        case .loading:
            IMGR_CustomSheetView.IMGR_loading()
        case .saved:
            IMGR_CustomSheetView.IMGR_saved()
        case .removeFavoutire(let type):
            IMGR_CustomSheetView.IMGR_removeFavourite(
                contentType: type,
                firstAction: { model.firstAction(.cancel) },
                secondAction: { model.secondAction(.delete) }
            )
        case .removeMOds(let title):
            IMGR_CustomSheetView.IMGR_removeMods(
                title: title,
                firstAction: { model.firstAction(.cancel) },
                secondAction: { model.secondAction(.delete) }
            )
        }
    }
}

extension IMGR_View {
    func showCustomSheet(sheetType: Binding<IMGR_CustomSheetModel?>) -> some View {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return modifier(IMGR_CustomSheetModifier(sheetType: sheetType))
    }
}
