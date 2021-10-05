//
//  AppDelegate.swift
//  Fabric
//
//  Created by ziad on 29/08/2021.
//

import UIKit
import IQKeyboardManager
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    

    fileprivate func tabBarStyle() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "PNU-Medium", size: 10)!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "PNU-Medium", size: 10)!], for: .selected)
    }
    
    fileprivate func navigationBarStyle() {
        UINavigationBar.appearance().backgroundColor = UIColor.white
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray ,NSAttributedString.Key.font: UIFont(name: "PNU-Medium", size: 14)!]
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    fileprivate func keyBoardStyle() {
        IQKeyboardManager.shared().isEnabled  = true
        IQKeyboardManager.shared().toolbarTintColor = .systemGreen
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        keyBoardStyle()
        tabBarStyle()
        navigationBarStyle()

        return true
    }


}

