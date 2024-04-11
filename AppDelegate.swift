//
//  AppDelegate.swift
//  MicroLoansApp
//
//  Created by Дмитрий Пономарев on 23.01.2024.
//

import UIKit
import OneSignalFramework

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        OneSignal.Debug.setLogLevel(.LL_VERBOSE)
        OneSignal.initialize("09e42387-f6eb-4e2c-aff2-fefe9c8efccd", withLaunchOptions: launchOptions)
        OneSignal.Notifications.requestPermission({ accepted in
          print("User accepted notifications: \(accepted)")
        }, fallbackToSettings: true)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

