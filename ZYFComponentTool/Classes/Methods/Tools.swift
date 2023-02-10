//
//  Tools.swift
//  ZYFTool
//
//  Created by 张云飞 on 2021/12/31.
//

import Foundation
import UIKit

//延时执行
public func timeDelay(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}
//颜色
public func HexColorstr(hexstr: String,alpha: CGFloat = 1.0) -> UIColor{
    return UIColor.colorHexColorstring(hexstr, alpha)
}

//获取当前控制器
public func zyf_curreVC() -> UIViewController{
    return ZYFTools.zyf_currentVC()
}


//去到指定 tabbar
func toTabarIndex(index: Int){
//    zyf_curreVC().navigationController?.popViewController(animated: false)
//    let tabar = UIApplication.shared.delegate?.window??.rootViewController! as! MainTabBarController
//    zyf_curreVC().navigationController?.popToViewController((zyf_curreVC().navigationController?.viewControllers[0])!, animated: true)
//    tabar.selectedIndex = index
}
