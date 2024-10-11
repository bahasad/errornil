//
//  AppDelegate.swift
//  HW6M3P8_FBWithAutorization
//
//  Created by Baha Sadyr on 10/5/24.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }

   
}

