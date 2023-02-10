//
//  UIViewController+ZYFExtension.swift
//  ZYFComponentTool
//
//  Created by 幸荟 on 2023/2/9.
//

import Foundation

public extension UIViewController{
    func zyf_pushVC(vc: UIViewController,animated: Bool){
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: animated)
    }
}
    
