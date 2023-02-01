//
//  ZYFTools.swift
//  ZYFComponentTool
//
//  Created by 幸荟 on 2023/1/31.
//

import Foundation

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
