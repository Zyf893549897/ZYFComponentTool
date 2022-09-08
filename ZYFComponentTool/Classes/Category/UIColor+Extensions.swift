//
//  UIColor+hexStringColor.swift
//  fistSwift
//
//  Created by jiarui on 2020/9/2.
//  Copyright © 2020 jiarui. All rights reserved.
//

import Foundation
import UIKit



public extension UIColor{
    
    class func ColorHexColorstring(_ hexadecimal:String,_ alpha:CGFloat = 1)->UIColor{
    var cstr = hexadecimal.trimmingCharacters(in:  CharacterSet.whitespacesAndNewlines).uppercased() as NSString;
        if(cstr.length < 6){
            return UIColor.clear;
         }
        if(cstr.hasPrefix("0X")){
            cstr = cstr.substring(from: 2) as NSString
        }
        if(cstr.hasPrefix("#")){
          cstr = cstr.substring(from: 1) as NSString
        }
         if(cstr.length != 6){
          return UIColor.clear;
        }
        var range = NSRange.init()
        range.location = 0
        range.length = 2
        //r
        let rStr = cstr.substring(with: range);
        //g
        range.location = 2;
        let gStr = cstr.substring(with: range)
        //b
        range.location = 4;
        let bStr = cstr.substring(with: range)
        var r :UInt32 = 0x0;
        var g :UInt32 = 0x0;
        var b :UInt32 = 0x0;
        Scanner.init(string: rStr).scanHexInt32(&r);
        Scanner.init(string: gStr).scanHexInt32(&g);
        Scanner.init(string: bStr).scanHexInt32(&b);
        return UIColor.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha);
      }
    
    ///RGB
    class func ColorRGB(r:CGFloat,g:CGFloat,b:CGFloat) ->UIColor{
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
      }
    ///随机色
    class func ColorRandomColor() ->  UIColor{
        let r = Int(arc4random_uniform(255))
        let g = Int(arc4random_uniform(255))
        let b = Int(arc4random_uniform(255))
        return ColorRGB(r: CGFloat(r), g: CGFloat(g), b: CGFloat(b))
      }
    
}
