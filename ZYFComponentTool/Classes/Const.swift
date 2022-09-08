//
//  Const.swift
//  ThreePartyLibraries
//
//  Created by 张云飞 on 2021/1/6.
//

// MARK: -引入公共库-
//@_exported import SnapKit


import Foundation
import UIKit

//工具类
let ZYFHUD = ZYFHUDManager.shared()
let ConstOC = Const_OC.init()

let ZYFApplication = UIApplication.shared
let ZYFAppWindow = UIApplication.shared.windows.first
let ZYFAppDelegate = UIApplication.shared.delegate
let ZYFRootViewController = UIApplication.shared.windows.first?.rootViewController
let ZYFUserDefaults = UserDefaults.standard

let ZYFScreenWidth = UIScreen.main.bounds.width
let ZYFScreenHeight = UIScreen.main.bounds.height
let ZYFScreenBounds = UIScreen.main.bounds

//获取状态栏的高度，全面屏手机的状态栏高度为44pt，非全面屏手机的状态栏高度为20pt
//状态栏高度
let ZYF_StatusBarHeight = UIApplication.shared.statusBarFrame.height
//导航栏高度
let ZYF_NavHeight = CGFloat((ZYF_StatusBarHeight + 44.0))
//tabbar高度
let ZYF_tabBarHeight = CGFloat((ZYF_StatusBarHeight>=20.0 ? 83.0 : 49.0))

//顶部的安全距离
let ZYF_TopHeight = ZYF_StatusBarHeight
//底部的安全距离，全面屏手机为34pt，非全面屏手机为0pt
let ZYF_BottomHeight = CGFloat((ZYF_tabBarHeight - 49.0))
//去除nav 和 tabbar 的高度之后  uiviewControll 区域的高度
let ZYF_ViewHeight = ZYFScreenHeight-(ZYF_NavHeight+ZYF_tabBarHeight)

let ZYFviewHeigt_nav = ZYFScreenHeight-ZYF_NavHeight

let ZYFColor_white = UIColor.white
let ZYFColor_clear = UIColor.clear
let ZYFColor_black = UIColor.black
let ZYFColor_darkGray = UIColor.darkGray
let ZYFColor_lightGray = UIColor.lightGray
let ZYFColor_gray = UIColor.gray
let ZYFColor_red = UIColor.red
let ZYFColor_blue = UIColor.blue
let ZYFColor_cyan = UIColor.cyan
let ZYFColor_green = UIColor.green
let ZYFColor_yellow = UIColor.yellow
let ZYFColor_magenta = UIColor.magenta
let ZYFColor_orange = UIColor.orange
let ZYFColor_purple = UIColor.purple
let ZYFColor_brown = UIColor.brown
let ZYFColor_Random = UIColor.ColorRandomColor()

//尺寸适配
public func scale(_ size: CGFloat) -> CGFloat {
    return size * ZYFScreenWidth / 375.0
}
//字体适配
public func scaleFont(_ font: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: font * ZYFScreenWidth / 375.0)
}
