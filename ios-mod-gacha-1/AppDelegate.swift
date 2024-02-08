//
//  AppDelegate.swift
//  mods-for-melon-playgorund
//
//  Created by Jack Flirenceon 11.12.2023.
//

import UIKit
import Adjust
import Pushwoosh
import AdSupport
import AppTrackingTransparency
import AVFAudio

typealias IMGR_AppDelegate = AppDelegate

class AppDelegate: NSObject, UIApplicationDelegate {

    private var _IMGR923: String { "_IMGR923" }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        var _IMGR321: Int { 0 }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Error setting up AVAudioSession: \(error.localizedDescription)")
        }

        IMGR_ThirdPartyServicesManager.shared.IMGR_initializePushwoosh(delegate: self)

        return true
    }
}

extension IMGR_AppDelegate: PWMessagingDelegate {
    //handle token received from APNS
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        Adjust.setDeviceToken(deviceToken)
        Pushwoosh.sharedInstance().handlePushRegistration(deviceToken)
    }

    //handle token receiving error
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        Pushwoosh.sharedInstance().handlePushRegistrationFailure(error);
    }

    //this is for iOS < 10 and for silent push notifications
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        Pushwoosh.sharedInstance().handlePushReceived(userInfo)
        completionHandler(.noData)
    }

    //this event is fired when the push gets received
    func pushwoosh(_ pushwoosh: Pushwoosh, onMessageReceived message: PWMessage) {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        print("onMessageReceived: ", message.payload?.description ?? "message.payload is nil")
    }

    //this event is fired when a user taps the notification
    func pushwoosh(_ pushwoosh: Pushwoosh, onMessageOpened message: PWMessage) {
        func IMGR_factorial(_ n: Int) -> Int {
            var result = 1
            for i in 1...n {
                result *= i
            }
            return result
        }
        print("onMessageOpened: ", message.payload?.description ?? "message.payload is nil")
    }
}

