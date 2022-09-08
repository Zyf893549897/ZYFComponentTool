//
//  Const_OC.swift
//  ZYFTools
//
//  Created by issuser on 2022/3/29.
//

import UIKit

public class Const_OC: NSObject {
    @objc public let Application = ZYFApplication
    @objc public let AppWindow = ZYFAppWindow
    @objc public let AppDelegate = ZYFAppDelegate
    @objc public let RootViewController = ZYFRootViewController
    @objc public let UserDefaults = ZYFUserDefaults


    @objc public let ScreenWidth = ZYFScreenWidth
    @objc public let ScreenHeight = ZYFScreenHeight
    @objc public let ScreenBounds = ZYFScreenBounds

    //获取状态栏的高度，全面屏手机的状态栏高度为44pt，非全面屏手机的状态栏高度为20pt
    //状态栏高度
    @objc public let StatusBarHeight = ZYF_StatusBarHeight
    //导航栏高度
    @objc  public let NavHeight = CGFloat((ZYF_StatusBarHeight + 44.0))
    //tabbar高度
    @objc public let tabBarHeight = CGFloat((ZYF_StatusBarHeight>=20.0 ? 83.0 : 49.0))

    //顶部的安全距离
    @objc public let TopHeight = ZYF_StatusBarHeight
    //底部的安全距离，全面屏手机为34pt，非全面屏手机为0pt
    @objc public let BottomHeight = CGFloat((ZYF_tabBarHeight - 49.0))
    //去除nav 和 tabbar 的高度之后  uiviewControll 区域的高度
    @objc public let ViewHeight = ZYFScreenHeight-(ZYF_NavHeight+ZYF_tabBarHeight)
    
    @objc public let viewHeigt_nav=ZYFviewHeigt_nav
    
   
    @objc public let Color_Random = ZYFColor_Random
    
    //尺寸适配
    @objc public func scale(_ size: CGFloat) -> CGFloat {
        return size * ZYFScreenWidth / 375.0
    }
    //字体适配
    @objc public func scaleFont(_ font: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: font * ZYFScreenWidth / 375.0)
    }
}
