//
//  mods_for_melon_playgorundApp.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 11.12.2023.
//

import SwiftUI
import Resolver

@main
struct mods_for_melon_playgorundApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    @Injected private var dropBox: IMGR_Dropbox
    @Injected private var coreDataStore: IMGR_CoreDataStore

    var body: some Scene {
        WindowGroup {
            IMGR_ContentView()
                .onAppear { IMGR_basicSetup() }
                .preferredColorScheme(.light)
                .environment(\.managedObjectContext, coreDataStore.viewContext)
        }
    }

    private func IMGR_basicSetup() {
        UIFont.familyNames.forEach({ familyName in
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            print(familyName, fontNames)
        })
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }

        UIApplication.shared.IMGR_addTapGestureRecognizer()
        dropBox.IMGR_init_Dropbox()

        UIButton.appearance().isMultipleTouchEnabled = false
        UIButton.appearance().isExclusiveTouch = true
        UIView.appearance().isMultipleTouchEnabled = false
        UIView.appearance().isExclusiveTouch = true

        UIRefreshControl.appearance().tintColor = UIColor.black

       
    }
}
