//
//  AppDelegate.swift
//  OrderApp
//
//  Created by David Santiago Jamaica Galvis on 5/9/25.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Set up the temporary directory for caching
        let temporaryDirectory = NSTemporaryDirectory()
        
        // Create a new URLCache with a memory capacity of 25MB and disk capacity of 50MB
        let urlCache = URLCache(memoryCapacity: 25_000_000, diskCapacity: 50_000_000, diskPath: temporaryDirectory)
        
        // Assign the URLCache to the shared cache
        URLCache.shared = urlCache
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Handle any resources specific to discarded scenes
    }
}


