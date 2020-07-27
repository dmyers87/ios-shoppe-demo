//
//  AppDelegate.swift
//  ios-shoppe-demo
//
//  Created on 3/3/20.
//  Copyright © 2020 FullStory All rights reserved.
//

import UIKit
import FullStory
import Firebase
import FirebaseCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, FSDelegate {

    func fullstoryDidStartSession(_ sessionUrl: String) {
        Analytics.setUserProperty(sessionUrl, forName: "last_fs_sessionURL")
    }

    func fullstoryDidStopSession() {

    }

    func fullstoryDidTerminateWithError(_ error: Error) {

    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        FS.delegate = self
        FirebaseApp.configure()

        // User Logs In...
        Analytics.setUserID(user.id.uuidString)
        Analytics.setUserProperty(user.email, forName: "user_email")
        Analytics.setUserProperty(FS.currentSessionURL, forName: "last_fsSessionURL")

        FS.identify(user.id.uuidString, userVars: user.infoDict)

//        // User Logs out...
//        FS.anonymize()
//        Analytics.resetAnalyticsData()

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

