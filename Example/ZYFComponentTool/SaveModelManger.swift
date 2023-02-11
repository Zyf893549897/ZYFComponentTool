//
//  SaveModelManger.swift
//  ZYFComponentTool_Example
//
//  Created by 幸荟 on 2023/2/11.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import YYKit
class SaveModelManger {
    static let sharedInstance = SaveModelManger()
    // 私有化初始化方法，防止外部通过 init 直接创建实例
    private init() {}
    
    var userinfo: UserModel?{
        get{
            let cache = YYCache.init(name: "userA")
            let dic = cache?.object(forKey: "user")
            return UserModel.model(withJSON: dic ?? [:])
        }
    }
    
    func saveUserInfo(info: UserModel){
        let cache = YYCache.init(name: "userA")
        let dic = info.modelToJSONObject() as? NSDictionary //modelToJSONObject 调用 在swift 中数据模型,变量前面要加  @objc，不然会解析为空
        cache?.setObject(dic, forKey: "user")
    }
}
