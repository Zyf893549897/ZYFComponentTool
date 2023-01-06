//
//  AppDelegate.swift
//  ZYFComponentTool
//
//  Created by 张云飞 on 09/06/2022.
//  Copyright (c) 2022 张云飞. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        let nav = UINavigationController.init(rootViewController: ViewController.init())
        nav.navigationBar.barTintColor = .red
        window?.rootViewController = nav
        
        return true
    }

    

}

