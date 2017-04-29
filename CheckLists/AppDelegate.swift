//
//  AppDelegate.swift
//  CheckLists
//
//  Created by Magdi Zamel on 4/17/17.
//  Copyright © 2017 Magdi Zamel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        DataManager.defaultManager.loadAllCategories()
        
        return true
    }
}

