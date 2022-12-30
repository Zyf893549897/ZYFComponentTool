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
    return UIColor.ColorHexColorstring(hexstr, alpha)
}
