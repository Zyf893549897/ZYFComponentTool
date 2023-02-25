//
//  AppDelegate+ZYFPush.swift
//  ZYFComponentTool_Example
//
//  Created by 幸荟 on 2023/2/20.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation



extension AppDelegate:UNUserNotificationCenterDelegate{
    
    func registerUPushLaunchOptions(launchOptions: [UIApplicationLaunchOptionsKey: Any]?){
        // 推送通知相关
        let entity = UMessageRegisterEntity.init()
        //type是对推送的几个参数的选择，可以选择一个或者多个。默认是三个全部打开，即：声音，弹窗，角标
        entity.types = Int(UMessageAuthorizationOptions.badge.rawValue | UMessageAuthorizationOptions.alert.rawValue | UMessageAuthorizationOptions.sound.rawValue)
        UNUserNotificationCenter.current().delegate = self
        UMessage.registerForRemoteNotifications(launchOptions: launchOptions, entity: entity) { granted, error in
        }
        
//        //  在登录的 地方调用
//        //登录成功时设置推送别名
//        UMessage.addAlias("123", type: "iOS") { (response, error) in
//            if response == nil {
//                print(error?.localizedDescription ?? "")
//            }else {
//                print("友盟：别名绑定成功")
//            }
//        }
    }
    
    
    //iOS10新增：处理前台收到通知的代理方法
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        if ((notification.request.trigger?.isKind(of: UNPushNotificationTrigger.self)) != nil) {
            UMessage.setAutoAlert(false)
            UMessage.didReceiveRemoteNotification(userInfo)
            //写了completionHandler前台才能接收到通知
            completionHandler([.alert, .sound, .badge])
        }else {
            //应用处于前台时的本地推送接受
        }
    }
    
    //iOS10新增：处理后台点击通知的代理方法
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        if ((response.notification.request.trigger?.isKind(of: UNPushNotificationTrigger.self)) != nil) {
            UMessage.setAutoAlert(false)
            UMessage.didReceiveRemoteNotification(userInfo)
        }else {
            //应用处于前台时的本地推送接受
        }
    }
    
    //测试用的deviceToken
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceId = deviceToken.map{ String(format: "%02.2hhx", $0) }.joined()
        UMessage.registerDeviceToken(deviceToken)
        print("deviceToken====\(deviceId)")
    }
    
    
    
    
}
