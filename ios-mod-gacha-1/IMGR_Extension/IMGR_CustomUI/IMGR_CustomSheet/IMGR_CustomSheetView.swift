//
//  CustomSheetView.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 17.11.2023.
//

import SwiftUI

struct IMGR_CustomSheetView {
    static func IMGR_loading() -> some View {
        IMGR_LargeButton(
            text: "Downloading",
            borderColor: .black,
            fontStyle: .IMGR_fontWithName(.concert, style: .bold, size: isIPad ? 40 : 20),
            backgroundColor: .white,
            foregroundColor: .black,
            height: isIPad ? 76 : 58,
            lineWidth: isIPad ? 4 : 2
        )
        .IMGR_iosDeviceTypeFrameAspec(iOSWidth: 250, isiOsAspec: true, iPadWidth: 450, isiPadAspec: true)
        .disabled(true)
    }

    static func IMGR_saved() -> some View {
        IMGR_LargeButton(
            text: "Saved",
            borderColor: .black,
            fontStyle: .IMGR_fontWithName(.concert, style: .bold, size: isIPad ? 40 : 20),
            backgroundColor: .white,
            foregroundColor: .black,
            height: isIPad ? 76 : 58,
            lineWidth: isIPad ? 4 : 2,
            alignment: .trailing,
            textAlignment: .leading,
            textPadding: (.leading, isIPad ? 32 : 24),
            additionalContent: {
                IMGR_CircleButton(
                    image: .iconFavorites,
                    ipaImagedSize: 30,
                    ipaButtonSize: 60,
                    bgColor: .black) {

                    }
                    .IMGR_iosDeviceTypePadding(edge: .trailing, iOSPadding: 4, iPadPadding: 8)
            }
        )
        .IMGR_iosDeviceTypeFrameAspec(iOSWidth: 250, isiOsAspec: true, iPadWidth: 450, isiPadAspec: true)
        .disabled(true)
    }

    static func IMGR_removeFavourite(
        contentType: IMGR_ContentType,
        firstAction: IMGR_EmptyClosure? = nil,
        secondAction: IMGR_EmptyClosure? = nil
    ) -> some View {
        VStack(spacing: 0) {
            Text("Are you sure?")
                .IMGR_iosDeviceTypeFont(font: .init(name: .concert, style: .bold, iPhoneSize: 20, iPadSize: 40))
                .foregroundColor(.black)
                .IMGR_iosDeviceTypePadding(edge: .bottom, iOSPadding: 4, iPadPadding: 8)
            Text("Do you want to delete a \(contentType.rawValue.lowercased()) from your favorites?")
                .IMGR_iosDeviceTypeFont(font: .init(name: .concert, style: .bold, iPhoneSize: 18, iPadSize: 36))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .IMGR_iosDeviceTypePadding(edge: .bottom, iOSPadding: 20, iPadPadding: 40)

            HStack(spacing: isIPad ? 16 : 8) {
                IMGR_LargeButton(
                    text: "Cancel",
                    borderColor: .black,
                    fontStyle: .IMGR_fontWithName(.concert, style: .bold, size: isIPad ? 36 : 18),
                    backgroundColor: .black,
                    foregroundColor: .white,
                    height: isIPad ? 76 : 53,
                    lineWidth: 1,
                    action: {
                        firstAction?()
                    }
                )
                IMGR_LargeButton(
                    text: "Delete",
                    borderColor: .black,
                    fontStyle: .IMGR_fontWithName(.concert, style: .bold, size: isIPad ? 36 : 18),
                    backgroundColor: .black,
                    foregroundColor: .white,
                    height: isIPad ? 76 : 53,
                    lineWidth: isIPad ? 4 : 2,
                    action: {
                        secondAction?()
                    }
                )
            }
        }
        .IMGR_iosDeviceTypePadding(edge: [.horizontal, .bottom], iOSPadding: 8, iPadPadding: 16)
        .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 12, iPadPadding: 24)
        .IMGR_addRoundedModifier(radius: isIPad ? 48 : 32, bgColor: .black)
        .frame(maxWidth: 700)
    }

    static func IMGR_removeMods(
        title: String,
        firstAction: IMGR_EmptyClosure? = nil,
        secondAction: IMGR_EmptyClosure? = nil
    ) -> some View {
        VStack(spacing: 0) {
            Text(title)
                .IMGR_iosDeviceTypeFont(font: .init(name: .concert, style: .bold, iPhoneSize: 20, iPadSize: 40))
                .foregroundColor(.black)
                .IMGR_iosDeviceTypePadding(edge: .bottom, iOSPadding: 4, iPadPadding: 8)
                .multilineTextAlignment(.center)

            Text("Delete this mod?")
                .IMGR_iosDeviceTypeFont(font: .init(name: .concert, style: .bold, iPhoneSize: 20, iPadSize: 40))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .IMGR_iosDeviceTypePadding(edge: .bottom, iOSPadding: 20, iPadPadding: 40)

            HStack(spacing: isIPad ? 16 : 8) {
                IMGR_LargeButton(
                    text: "Cancel",
                    borderColor: .black,
                    fontStyle: .IMGR_fontWithName(.concert, style: .bold, size: isIPad ? 36 : 18),
                    backgroundColor: .black,
                    foregroundColor: .white,
                    height: isIPad ? 76 : 53,
                    lineWidth: 1,
                    action: {
                        firstAction?()
                    }
                )
                IMGR_LargeButton(
                    text: "Delete",
                    borderColor: .black,
                    fontStyle: .IMGR_fontWithName(.concert, style: .bold, size: isIPad ? 36 : 18),
                    backgroundColor: .black,
                    foregroundColor: .white,
                    height: isIPad ? 76 : 53,
                    lineWidth: isIPad ? 4 : 2,
                    action: {
                        secondAction?()
                    }
                )
            }
        }
        .IMGR_iosDeviceTypePadding(edge: [.horizontal, .bottom], iOSPadding: 8, iPadPadding: 16)
        .IMGR_iosDeviceTypePadding(edge: .top, iOSPadding: 12, iPadPadding: 24)
        .IMGR_addRoundedModifier(radius: isIPad ? 48 : 32, bgColor: .black)
        .frame(maxWidth: 700)
    }
}

#Preview {
    IMGR_CustomSheetView.IMGR_removeFavourite(contentType: .mods, firstAction: { }, secondAction: { })
        .preferredColorScheme(.light)
}
