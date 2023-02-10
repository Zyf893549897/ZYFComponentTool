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
//        let nav = UINavigationController.rootVC(ViewController.init())// nav root 方法
        window?.rootViewController = RootTabBarVC.init()
        
        //全局设置   导航栏
        setupNavBar()
        
        return true
    }

    //导航栏设置
    func setupNavBar(){
        GKNavigationBarConfigure.sharedInstance().setupCustomConfigure { configure in
            let v = UIView.init(frame: CGRect(x: 0, y: 0, width: ZYFScreenWidth, height: ZYF_NavHeight))
            configure.backgroundImage = v.image(withColors: [UIColor.red.cgColor,UIColor.orange.cgColor])
            configure.darkBackgroundImage = UIImage.gk_image(with: UIColor.lightGray)
            configure.backgroundColor = .blue
            configure.titleColor = .white
            configure.titleFont = UIFont.systemFont(ofSize: 18.0)
            configure.backStyle = .white
            configure.statusBarStyle = .lightContent
            configure.gk_navItemLeftSpace = 0.0
            configure.gk_navItemRightSpace = 5.0
            configure.gk_restoreSystemNavBar = true
        }
    }

}

