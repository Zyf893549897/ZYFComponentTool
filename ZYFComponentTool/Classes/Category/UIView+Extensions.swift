//
//  UIView+Extension.swift
//  fistSwift
//
//  Created by jiarui on 2020/9/3.
//  Copyright © 2020 jiarui. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    //获取视图的X坐标
    var zyf_x:CGFloat{
        get{
            return self.frame.origin.x;
        }
        set{
            var frames = self.frame;
            frames.origin.x = CGFloat(newValue);
            self.frame = frames;
        }
    }
    
    //获取视图的Y坐标
    var zyf_y:CGFloat{
        get{
            return self.frame.origin.y;
        }
        
        set{
            var frames = self.frame;
            frames.origin.y = CGFloat(newValue);
            self.frame = frames;
        }
    }
    
    //获取视图的宽
    var zyf_width:CGFloat{
        get{
            return self.frame.size.width;
        }
        
        set{
            var frames = self.frame;
            frames.size.width = CGFloat(newValue);
            self.frame = frames;
        }
    }
    
    //获取视图的高
    var zyf_height:CGFloat{
        get{
            return self.frame.size.height;
        }
        
        set{
            var frames = self.frame;
            frames.size.height = CGFloat(newValue);
            self.frame = frames;
        }
    }
    
    //获取最大的y坐标
    var endY:CGFloat{
        get{
            return self.zyf_y + self.zyf_height;
        }
        
        set{
            var frames = self.frame;
            frames.origin.y = CGFloat(newValue - self.zyf_height);
            self.frame = frames;
        }
    }
    
    //获取最大的X坐标
    var endX:CGFloat{
        get{
            return self.zyf_x + self.zyf_width;
        }
        set{
            var frames = self.frame;
            frames.origin.x = CGFloat(newValue - self.zyf_width);
            self.frame = frames;
        }
    }
    
    //中心点X坐标
    var zyf_centerX:CGFloat{
        get{
            return self.center.x;
        }
        set{
            self.center = CGPoint(x:CGFloat(newValue),y:self.center.y);
        }
    }
    //中心点Y坐标
    var zyf_centerY:CGFloat{
        get{
            return self.center.y;
        }
        set{
            self.center = CGPoint(x:self.center.x,y:CGFloat(newValue));
        }
    }
    
    /// 删除所有的子视图
    func removeAllSubView() -> Void {
        for view : UIView in self.subviews{
            view.removeFromSuperview();
        }
    }
    // 倒角和边框
    func setLayer(_ radius :CGFloat,_ bordwidth :CGFloat,_ color :UIColor) -> Void {
        self.layer.cornerRadius=radius
        self.layer.borderWidth=bordwidth
        self.layer.borderColor=color.cgColor
    }
    //view所处的控制器
    var currentVC:UIViewController{
        get{
            return ZYFTools.zyf_currentVC()
        }
    }
}
public extension UIView {
    enum ShadowType: Int {
        case all = 0 ///四周
        case top  = 1 ///上方
        case left = 2///左边
        case right = 3///右边
        case bottom = 4///下方
    }
    ///默认设置：黑色阴影
    func shadow(_ type: ShadowType) {
        shadow(type: type, color: .black, opactiy: 0.4, shadowSize: 4)
    }
    ///常规设置
    func shadow(type: ShadowType, color: UIColor,  opactiy: Float, shadowSize: CGFloat) -> Void {
        layer.masksToBounds = false;//必须要等于NO否则会把阴影切割隐藏掉
        layer.shadowColor = color.cgColor;// 阴影颜色
        layer.shadowOpacity = opactiy;// 阴影透明度，默认0
        layer.shadowOffset = .zero;//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
        layer.shadowRadius = 3 //阴影半径，默认3
        var shadowRect: CGRect?
        switch type {
        case .all:
            shadowRect = CGRect.init(x: -shadowSize, y: -shadowSize, width: bounds.size.width + 2 * shadowSize, height: bounds.size.height + 2 * shadowSize)
        case .top:
            shadowRect = CGRect.init(x: -shadowSize, y: -shadowSize, width: bounds.size.width + 2 * shadowSize, height: 2 * shadowSize)
        case .bottom:
            shadowRect = CGRect.init(x: -shadowSize, y: bounds.size.height - shadowSize, width: bounds.size.width + 2 * shadowSize, height: 2 * shadowSize)
        case .left:
            shadowRect = CGRect.init(x: -shadowSize, y: -shadowSize, width: 2 * shadowSize, height: bounds.size.height + 2 * shadowSize)
        case .right:
            shadowRect = CGRect.init(x: bounds.size.width - shadowSize, y: -shadowSize, width: 2 * shadowSize, height: bounds.size.height + 2 * shadowSize)
        }
        layer.shadowPath = UIBezierPath.init(rect: shadowRect!).cgPath
    }
    
    
}
