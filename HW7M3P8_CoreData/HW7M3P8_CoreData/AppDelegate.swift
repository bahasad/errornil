//
//  AppDelegate.swift
//  HW7M3P8_CoreData
//
//  Created by Baha Sadyr on 10/12/24.
//

import UIKit


@main 
class AppDelegate: UIResponder, UIApplicationDelegate {

    //UserDefaults.standard.set(true, forKey: "com.apple.CoreData.SQLDebug")


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
       
    }

    

    

}
