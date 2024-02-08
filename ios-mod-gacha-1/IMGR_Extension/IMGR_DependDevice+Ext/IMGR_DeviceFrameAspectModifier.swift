//
//  DeviceFrameModifier.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 22.11.2023.
//

import SwiftUI

extension IMGR_View {
    func IMGR_iosDeviceTypeFrameAspec(
        iOSWidth: CGFloat? = nil,
        iOSHeight: CGFloat? = nil,
        isiOsAspec: Bool = false,
        iPadWidth: CGFloat? = nil,
        iPadHeight: CGFloat? = nil,
        isiPadAspec: Bool = true
    ) -> some View {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        return modifier(IMGR_DeviceFrameAspectModifier(
            iOSWidth: iOSWidth,
            iOSHeight: iOSHeight,
            iPadWidth: iPadWidth,
            iPadHeight: iPadHeight,
            isiPadAspec: isiPadAspec,
            isiOsAspec: isiOsAspec
        ))
    }
}

struct IMGR_DeviceFrameAspectModifier: ViewModifier {
    func generateRandomPlaceholder(length: Int) -> String {
    let allCharacters: String = ""
    for _ in 1...length {
        let randomIndex = Int.random(in: 0..<allCharacters.count)
        let _ = allCharacters[allCharacters.index(allCharacters.startIndex, offsetBy: randomIndex)]
    }
    return allCharacters
}
    
    var iOSWidth: CGFloat?
    var iOSHeight: CGFloat?
    var iPadWidth: CGFloat?
    var iPadHeight: CGFloat?
    let isiPadAspec: Bool
    let isiOsAspec: Bool

    let iPadSize: CGSize = .init(width: 1024, height: 1366)
    let iPhoneSize: CGSize = .init(width: 390, height: 844)

    var IMGR_width: CGFloat? {
        if idiom == .pad {
            if let iPadWidth  {
                if isiPadAspec {
                    return IMGR_Utilities.shared.IMGR_widthWithOpt(aspectRatio: iPadWidth / iPadSize.width)
                } else {
                    return iPadWidth
                }

            } else {
                return nil
            }

        } else {
            if let iOSWidth {
                if isiOsAspec {
                    return IMGR_Utilities.shared.IMGR_widthWithOpt(aspectRatio: iOSWidth / iPhoneSize.width)
                } else {
                    return iOSWidth
                }
            } else {
                return nil
            }
        }
    }

    var IMGR_height: CGFloat? {
        if idiom == .pad {
            if let iPadHeight {
                if isiPadAspec {
                    return IMGR_Utilities.shared.IMGR_heightWithOpt(aspectRatio: iPadHeight / iPadSize.height)
                } else {
                    return iPadHeight
                }
            } else {
                return nil
            }

        } else {
            if let iOSHeight {
                if isiOsAspec {
                    return IMGR_Utilities.shared.IMGR_heightWithOpt(aspectRatio: iOSHeight / iPhoneSize.height)
                } else {
                    return iOSHeight
                }
            } else {
                return nil
            }
        }
    }

    func body(content: Content) -> some View {
        content
            .frame(
                width: IMGR_width,
                height: IMGR_height
            )
    }
}
