//
//  UIBarButtonItem+ZYFExtensions.swift
//  ZYFTool
//
//  Created by 张云飞 on 2021/12/30.
//

import Foundation
import UIKit
public extension UIBarButtonItem{
    // 创建 文字 左按键
    @objc class func zyf_creatLeftTitleButton(title: String?,bgcolor: UIColor,textColor: UIColor,target: Any?,action: Selector?) -> UIBarButtonItem {
        let but = ZYFCreateTitleButton(frame: CGRect(x: 0, y: 0, width: 45, height: 40), text: title, bgcolor: bgcolor, textcolor: textColor, font: 15, Alignment: .left, offset: 0, target: target, action: action)
        let item = UIBarButtonItem.init(customView: but)
        return item
    }
    // 创建 图片 左按键
    @objc class func zyf_creatLeftImageButton(name: String?,target: Any?,action: Selector?) -> UIBarButtonItem {
        let but = ZYFCreateImageButton(frame: CGRect(x: 0, y: 0, width: 45, height: 40), bgcolor: ZYFColor_clear, Alignment: .left, imgName: name, isbg: false, offset: 0, target: target, action: action)
        let item = UIBarButtonItem.init(customView: but)
        return item
    }
    
    // 创建 文字 右按键
    @objc class func zyf_creatRightTitleButton(title: String?,bgcolor: UIColor,textColor: UIColor,target: Any?,action: Selector?) -> UIBarButtonItem {
        let but = ZYFCreateTitleButton(frame: CGRect(x: 0, y: 0, width: 45, height: 40), text: title, bgcolor: bgcolor, textcolor: textColor, font: 15, Alignment: .right, offset: 0, target: target, action: action)
        let item = UIBarButtonItem.init(customView: but)
        return item
    }
    // 创建 图片 右按键
    @objc class func zyf_creatRightImageButton(name: String?,target: Any?,action: Selector?) -> UIBarButtonItem {
        let but = ZYFCreateImageButton(frame: CGRect(x: 0, y: 0, width: 45, height: 40), bgcolor: ZYFColor_clear, Alignment: .right, imgName: name, isbg: false, offset: 0, target: target, action: action)
        let item = UIBarButtonItem.init(customView: but)
        return item
    }
}
