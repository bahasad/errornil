//
//  SceneDelegate.swift
//  HW6M3P8_FBWithAutorization
//
//  Created by Baha Sadyr on 10/5/24.
//

import UIKit

enum WindowCase {
    case login, reg, home
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    
    private let fbManager = FBManager()
    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(routeVC(notification: )), name: Notification.Name(rawValue: "routeVC") , object: nil)
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        
        if fbManager.isLogin() {
            self.window?.rootViewController = windowManager(vc: .home)
        } else {
            self.window?.rootViewController = windowManager(vc: .reg)
        }
        
        self.window?.makeKeyAndVisible()
    }
    
    private func windowManager(vc: WindowCase) -> UIViewController {
        switch vc {
        case .login:
            return LoginVC()
        case .reg:
            return RegistrationVC()
        case .home:
            return UINavigationController(rootViewController:  HomeVC())
        }
    }

    
    @objc func routeVC(notification: Notification) {
        guard let userInfo = notification.userInfo, let vc = userInfo["vc"] as? WindowCase else { return }
        self.window?.rootViewController = windowManager(vc: vc)
    }
}

