//
//  ContentView.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 11.12.2023.
//

import SwiftUI
import CoreData

struct IMGR_ContentView: View {

    @State private var splashScreenIsShow: Bool = false
    @State private var sheetType: IMGR_CustomSheetModel?

    var body: some View {
        VStack(spacing: 0) {
            if splashScreenIsShow {
                IMGR_FlowView()
            } else {
                IMGR_SplashScreen(splashScreenIsShow: $splashScreenIsShow)
            }
        }
        .showCustomSheet(sheetType: $sheetType)
        .IMGR_onCreateSheet { type in
            withAnimation(.default.speed(1)) {
                sheetType = type
            }
        }
        .task {
            await Task.IMGR_sleep(seconds: 1)
            IMGR_ThirdPartyServicesManager.shared.IMGR_makeATT()
        }
    }

}

#Preview {
    IMGR_ContentView()
}
