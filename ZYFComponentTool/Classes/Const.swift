//
//  Const.swift
//  ThreePartyLibraries
//
//  Created by 张云飞 on 2021/1/6.
//

// MARK: -引入公共库-
@_exported import SnapKit


import Foundation
import UIKit

//工具类
public let ZYFHUD = ZYFHUDManager.shared()
public let ConstOC = Const_OC.init()

public let ZYFApplication = UIApplication.shared
public let ZYFAppWindow = UIApplication.shared.windows.first
public let ZYFAppDelegate = UIApplication.shared.delegate
public let ZYFRootViewController = UIApplication.shared.windows.first?.rootViewController
public let ZYFUserDefaults = UserDefaults.standard
public let ZYFNotificationCenter = NotificationCenter.default

public let ZYFScreenWidth = UIScreen.main.bounds.width
public let ZYFScreenHeight = UIScreen.main.bounds.height
public let ZYFScreenBounds = UIScreen.main.bounds

//获取状态栏的高度，全面屏手机的状态栏高度为44pt，非全面屏手机的状态栏高度为20pt

//状态栏高度
public let ZYF_StatusBarHeight = UIApplication.shared.statusBarFrame.size.height

//顶部安全距离
public var ZYF_TopSafeAreaHeight: CGFloat{
    get{
        if #available(iOS 11.0, *) {
            return UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0.0
        } else {
            return 0
        }
    }
}
//底部安全距离
public var ZYF_BottomSafeAreaHeight: CGFloat{
    get{
        if #available(iOS 11.0, *) {
            return UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0.0
        } else {
            return 0
        }
    }
}

public let ZYF_bottom = ZYF_BottomSafeAreaHeight == 0 ? 20:ZYF_BottomSafeAreaHeight

//是否为刘海屏
public let ZYF_isiPhoneX = ZYF_StatusBarHeight > 20.0 ? true : false

//自定义nav 时 title 距离顶部的 距离
public let ZYF_NavTitle_Top = (ZYF_isiPhoneX == true ? ZYF_TopSafeAreaHeight:36.0)

//导航栏高度
public let ZYF_NavHeight = CGFloat((ZYF_StatusBarHeight + 44.0))
//tabbar高度
public let ZYF_tabBarHeight = CGFloat((ZYF_StatusBarHeight>20.0 ? 83.0 : 49.0))

//去除nav 和 tabbar 的高度之后  uiviewControll 区域的高度
public let ZYF_ViewHeight = ZYFScreenHeight-(ZYF_NavHeight+ZYF_tabBarHeight)
//去除nav   uiviewControll 区域的高度
public let ZYFviewHeigt_nav = ZYFScreenHeight-ZYF_NavHeight



let ZYFColor_Random = UIColor.ColorRandomColor()

//尺寸适配
public func scale(_ size: CGFloat) -> CGFloat {
    return ceil(size * ZYFScreenWidth / 375.0)
}
//字体适配
public func scaleFont(_ font: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: font * ZYFScreenWidth / 375.0)
}



//公用 闭包
public typealias NoArgumentsBlock = () -> Void
public typealias ReturnIndexBlock = (Int) -> Void
public typealias ReturnFloatBlock = (CGFloat) -> Void
public typealias ReturnStringBlock = (String) -> Void
