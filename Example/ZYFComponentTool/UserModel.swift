//
//  UserModel.swift
//  ZYFComponentTool_Example
//
//  Created by 幸荟 on 2023/2/11.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class UserModel: BaseModel {
    @objc var name: String?
    @objc var phone: String = ""
    @objc var age: String = ""
    @objc var mes: String?
    @objc var txmodel: TestModel?
    @objc var dataArr: Array<TestModel>?
}
