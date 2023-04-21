//
//  AppDelegate+ZYFShare.swift
//  ZYFComponentTool_Example
//
//  Created by 张云飞 on 2023/2/24.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
//分享  基于友盟
extension AppDelegate{
    //友盟分享
    func setUMShareMessage(){
        UMSocialManager.default().setPlaform(.wechatSession, appKey: "wx908029eda6b3dc46", appSecret: "5ba0be13aefc93a2567a2eb3b350f24e", redirectURL: nil)
    }
}
