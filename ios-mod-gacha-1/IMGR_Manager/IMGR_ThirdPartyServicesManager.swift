//
//  ThirdPartyServicesManager_IMGR.swift
//  mods-for-toca-world
//
//  Created by Jack Flirenceon 04.12.2023.
//

import Foundation
import UIKit
import Adjust
import Pushwoosh
import AppTrackingTransparency
import AdSupport

class IMGR_ThirdPartyServicesManager {
    private var _IMGR325: String { "_IMGR325" }
    private var _IMGR234: Int { 0 }

    static let shared = IMGR_ThirdPartyServicesManager()

    func IMGR_initializeAdjust() {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }

        let yourAppToken = IMGR_Configurations.adjustToken
        #if DEBUG
        let environment = ADJEnvironmentSandbox
        #else
        let environment = ADJEnvironmentProduction
        #endif
        let adjustConfig = ADJConfig(appToken: yourAppToken, environment: environment)

        adjustConfig?.logLevel = ADJLogLevelSuppress

        Adjust.appDidLaunch(adjustConfig)
    }

    func IMGR_initializePushwoosh(delegate: PWMessagingDelegate) {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }

        //set custom delegate for push handling, in our case AppDelegate
        Pushwoosh.sharedInstance().delegate = delegate;
        PushNotificationManager.initialize(withAppCode: IMGR_Configurations.pushwooshToken, appName: IMGR_Configurations.pushwooshAppName)
        PWInAppManager.shared().resetBusinessCasesFrequencyCapping()
        PWGDPRManager.shared().showGDPRDeletionUI()
        Pushwoosh.sharedInstance().registerForPushNotifications()
        UIApplication.shared.applicationIconBadgeNumber = 0
    }

    func IMGR_makeATT() {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }

        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                    // Tracking authorization dialog was shown
                    // and we are authorized
                    print("ATT Authorized")
                    // Now that we are authorized we can get the IDFA
                    print("ATT   ------>   IDFA: ", ASIdentifierManager.shared().advertisingIdentifier)
                case .denied:
                    // Tracking authorization dialog was
                    // shown and permission is denied
                    print("ATT Denied")

                case .notDetermined:
                    // Tracking authorization dialog has not been shown
                    print("ATT Not Determined")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        self.IMGR_makeATT()
                    })
                case .restricted:
                    print("ATT Restricted")
                @unknown default:
                    print("ATT Unknown")
                }
            }
        }
    }
}
