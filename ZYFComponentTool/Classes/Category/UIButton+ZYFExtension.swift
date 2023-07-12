//
//  UIButton+ZYFExtension.swift
//  ZYFComponentTool
//
//  Created by 张云飞 on 2023/7/12.
//

import Foundation

public enum ZYFUIButtonEdgeInsetsStyle {
    case z_img_Top
    case z_img_Left
    case z_img_Right
    case z_img_Bottom
}

private var titleKey: String?
private var indexKey: String?
private var typeKey: String?

public extension UIButton {
     func layoutButton(withEdgeInsetsStyle style: ZYFUIButtonEdgeInsetsStyle, imageTitleSpace space: CGFloat, offset: CGFloat) {
        let imageWidth = self.currentImage?.size.width ?? 0.0
        let imageHeight = self.currentImage?.size.height ?? 0.0
        
        var labelWidth: CGFloat = 0.0
        var labelHeight: CGFloat = 0.0
        
        if #available(iOS 8.0, *) {
            labelWidth = self.titleLabel?.intrinsicContentSize.width ?? 0.0
            labelHeight = self.titleLabel?.intrinsicContentSize.height ?? 0.0
        } else {
            labelWidth = self.titleLabel?.frame.size.width ?? 0.0
            labelHeight = self.titleLabel?.frame.size.height ?? 0.0
        }
        
        var imageEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets = UIEdgeInsets.zero
        
        switch style {
        case .z_img_Top:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight - space, left: 0, bottom: 0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth, bottom: -imageHeight - space, right: 0)
            
        case .z_img_Left:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: space)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: space, bottom: 0, right: 0)
            
            if self.contentHorizontalAlignment == .right {
                imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: space + offset)
                labelEdgeInsets = UIEdgeInsets(top: 0, left: space, bottom: 0, right: offset)
            } else if self.contentHorizontalAlignment == .left {
                imageEdgeInsets = UIEdgeInsets(top: 0, left: offset, bottom: 0, right: space)
                labelEdgeInsets = UIEdgeInsets(top: 0, left: space + offset, bottom: 0, right: 0)
            }
            
        case .z_img_Bottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight - space, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight - space, left: -imageWidth, bottom: 0, right: 0)
            
        case .z_img_Right:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth + space, bottom: 0, right: -labelWidth - space)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth - space, bottom: 0, right: imageWidth + space)
            
            if self.contentHorizontalAlignment == .right {
                imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth + space, bottom: 0, right: -labelWidth + offset)
                labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth - space, bottom: 0, right: imageWidth + space + offset)
            } else if self.contentHorizontalAlignment == .left {
                imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth + space + offset, bottom: 0, right: -labelWidth - space)
                labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth + offset, bottom: 0, right: imageWidth + space)
            }
        }
        
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
    }
    // 偏移距离 只有文字时 设置偏移距离
    func titleOffsetDistance(offset: CGFloat) {
        var labelEdgeInsets = UIEdgeInsets.zero
        if self.contentHorizontalAlignment == .right {
            labelEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: offset)
        } else if self.contentHorizontalAlignment == .left {
            labelEdgeInsets = UIEdgeInsets(top: 0, left: offset, bottom: 0, right: 0)
        }
        self.titleEdgeInsets = labelEdgeInsets
    }
    // 图片偏移距离
    func imageOffsetDistance(offset: CGFloat) {
        var imgEdgeInsets = UIEdgeInsets.zero
        if self.contentHorizontalAlignment == .right {
            imgEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: offset)
        } else if self.contentHorizontalAlignment == .left {
            imgEdgeInsets = UIEdgeInsets(top: 0, left: offset, bottom: 0, right: 0)
        }
        self.imageEdgeInsets = imgEdgeInsets
    }
    var title: String{
        get {
            return objc_getAssociatedObject(self, &titleKey) as? String ?? ""
        }
        set {
            objc_setAssociatedObject(self, &titleKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    var indexPath: IndexPath{
        get {
            return objc_getAssociatedObject(self, &indexKey) as? IndexPath ?? IndexPath.init()
        }
        set {
            objc_setAssociatedObject(self, &indexKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    var index: Int{
        get {
            return objc_getAssociatedObject(self, &typeKey) as? Int ?? 0
        }
        set {
            objc_setAssociatedObject(self, &typeKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
}
