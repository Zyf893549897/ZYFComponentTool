//
//  ZYFDefaultsKeys.swift
//  ZYFComponentTool
//
//  Created by 张云飞 on 2023/7/13.
//

import Foundation
import SwiftyUserDefaults

public extension DefaultsKeys {
    // 测试值  bool
    var testdefaults: DefaultsKey<Bool> { .init("zyf.com.testdefaults", defaultValue: false) }
    // 测试值  str
    var teststr: DefaultsKey<String> { .init("zyf.com.teststr", defaultValue: "") }
}
