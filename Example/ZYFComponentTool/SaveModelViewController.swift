//
//  SaveModelViewController.swift
//  ZYFComponentTool_Example
//
//  Created by 张云飞 on 2023/2/11.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import YYKit
import SwiftyUserDefaults
class SaveModelViewController: ZYFBaseViewController {
    var model = UserModel.init()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        model.name = "zhangyunfei"
        model.age = "20"
        let txmodel = TestModel.init()
        txmodel.name = "ting"
        model.txmodel = txmodel
        model.dataArr = [txmodel,txmodel]
   
        SaveModelManger.sharedInstance.saveUserInfo(info: model)
        
        print("======\(SaveModelManger.sharedInstance.userinfo?.name ?? "")")
        print("======\(SaveModelManger.sharedInstance.userinfo?.age ?? "")")
        print("======\(SaveModelManger.sharedInstance.userinfo?.phone ?? "")")
    
        
        print("====\(model.modelToJSONObject() as? NSDictionary)")
        
        
        print("=======aaaaa=====\(Defaults.testdefaults)======\(Defaults.teststr)")
        // Defaults 存储数据
        Defaults.testdefaults = true
        Defaults.teststr = "zyf"
    }
    
    
   
  
}
