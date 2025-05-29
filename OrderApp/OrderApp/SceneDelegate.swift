//
//  SceneDelegate.swift
//  OrderApp
//
//  Created by David Santiago Jamaica Galvis on 5/9/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var orderTabBarItem: UITabBarItem!
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard (scene is UIWindowScene) else { return }
        
        // This assumes you are using Storyboard-based UI
        guard let window = window else { return }
        self.window = window
        
        // Defer tab bar item access until view controllers are set
        if let tabBarController = window.rootViewController as? UITabBarController,
           tabBarController.viewControllers?.count ?? 0 > 1 {
            orderTabBarItem = tabBarController.viewControllers?[1].tabBarItem
        }

        NotificationCenter.default.addObserver(self, selector: #selector(updateOrderBadge), name: MenuController.orderUpdatedNotification, object: nil)
        
        updateOrderBadge()
    }

    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // Method to update the badge value when the order is updated
    @objc func updateOrderBadge() {
        switch MenuController.shared.order.menuItems.count {
        case 0:
            orderTabBarItem.badgeValue = nil
        case let count:
            orderTabBarItem.badgeValue = String(count)
        }
    }
}



