//
//  AppDelegate.swift
//  KarrotHome
//
//  Created by 이재은 on 2021/07/19.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UserManager.placesKey = ["Hongje", "Sunae1"]
        UserManager.currentPlaceKey = "Hongje"
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: HomeViewController())
        self.window?.makeKeyAndVisible()
        return true
    }
}

