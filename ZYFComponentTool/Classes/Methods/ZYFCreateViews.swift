//
//  ZYFCreateViews.swift
//  fistSwift
//
//  Created by 张云飞 on 2020/12/24.
//  Copyright © 2020 jiarui. All rights reserved.
//

import UIKit
import CoreGraphics

//创建lable
public func ZYFCreatLable(frame: CGRect?,text: String?,textcolor: UIColor?,Alignment: NSTextAlignment?,font: UIFont?,bgcolor: UIColor?,num: Int?) -> UILabel {
    let lable=UILabel.init()
    lable.frame=frame ?? .zero
    lable.text=text
    lable.textColor=textcolor
    lable.textAlignment=Alignment ?? .left
    lable.backgroundColor=bgcolor
    lable.font=font
    lable.numberOfLines=num ?? 0
    return lable
}
//创建 title 和 带图片 button
public func ZYFCreateButton(frame: CGRect?,text: String?,bgcolor: UIColor?,textcolor: UIColor?,font: UIFont?,Alignment: UIControl.ContentHorizontalAlignment?,imgName: String?,isbg: Bool?,imgStyle: ZYFUIButtonEdgeInsetsStyle?,space: CGFloat?,offset: CGFloat?,target: Any?,action: Selector?) -> UIButton {
    let button = UIButton.init()
    button.frame=frame ?? .zero
    if isbg ?? false {
        if let imgNameCount = imgName?.count,imgNameCount > 0{
            button.setBackgroundImage(UIImage(named: imgName ?? ""), for: .normal)
        }
    }else{
        if let imgNameCount = imgName?.count,imgNameCount > 0 {
            button.setImage(UIImage(named: imgName ?? ""), for: .normal)
        }
    }
    button.setTitle(text, for: .normal)
    button.setTitleColor(textcolor ?? UIColor.clear, for: .normal)
    button.contentHorizontalAlignment=Alignment ?? .center
    // Alignment 为 left和right时  和 offset 生效
    button.layoutButton(withEdgeInsetsStyle: imgStyle ?? .z_img_Left, imageTitleSpace: space ?? 0, offset: offset ?? 0)
    button.backgroundColor=bgcolor ?? UIColor.clear
    button.titleLabel?.font=font
    button.addTarget(target, action: action ?? Selector(("butAction")), for: .touchUpInside)
    return button
}
//创建带只有图片 的but
public func ZYFCreateImageButton(frame: CGRect?,bgcolor: UIColor?,Alignment: UIControl.ContentHorizontalAlignment?,imgName: String?,isbg: Bool?,offset: CGFloat?,target: Any?,action: Selector?) -> UIButton {
    let button = UIButton.init()
    button.frame=frame ?? .zero
    if isbg ?? false {
        if let imgNameCount = imgName?.count,imgNameCount > 0{
            button.setBackgroundImage(UIImage(named: imgName ?? ""), for: .normal)
        }
    }else{
        if let imgNameCount = imgName?.count,imgNameCount > 0 {
            button.setImage(UIImage(named: imgName ?? ""), for: .normal)
        }
    }
    button.contentHorizontalAlignment=Alignment ?? .center
    // Alignment 为 left和right时  和 offset 生效
    button.imageOffsetDistance(offset: offset ?? 0)
    button.backgroundColor=bgcolor ?? UIColor.clear
    button.addTarget(target, action: action ?? Selector(("butAction")), for: .touchUpInside)
    return button
}
//创建文字button
public func ZYFCreateTitleButton(frame: CGRect?,text: String?,bgcolor: UIColor?,textcolor: UIColor?,font: UIFont?,Alignment: UIControl.ContentHorizontalAlignment?,offset: CGFloat?,target: Any?,action: Selector?) -> UIButton {
    let button = UIButton.init()
    button.frame=frame ?? .zero
    button.setTitle(text, for: .normal)
    button.setTitleColor(textcolor ?? UIColor.clear, for: .normal)
    button.contentHorizontalAlignment=Alignment ?? .center
    // Alignment 为 left和right时  和 offset 生效
    button.titleOffsetDistance(offset: offset ?? 0)
    button.backgroundColor=bgcolor ?? UIColor.clear
    button.titleLabel?.font = font
    button.addTarget(target, action: action ?? Selector(("butAction")), for: .touchUpInside)
    return button
}
//创建UIimageView
public func ZYFCreatImageView(frame: CGRect,imgName: String?,bgcolor: UIColor?,radius: CGFloat) -> UIImageView{
    let imgView=UIImageView.init()
    imgView.frame=frame
    if let stringCount = imgName?.count,stringCount > 0 {
        imgView.image=UIImage(named: imgName ?? "")
    }
    if radius > 0{
        imgView.layer.cornerRadius=radius
        imgView.clipsToBounds=true
    }
    imgView.backgroundColor = bgcolor ?? .clear
    return imgView
}
//创建uiview
public func ZYFCreateView(frame: CGRect,bgcolor: UIColor?,radius: CGFloat) -> UIView {
    let view = UIView.init(frame: frame)
    view.backgroundColor=bgcolor ?? UIColor.clear
    if radius > 0 {
        view.layer.cornerRadius=radius
    }
    return view
}
//创建UItextfiled
public func ZYFCreateTextfiled(frame: CGRect?,placeholder: String?,Alignment: NSTextAlignment?,font: UIFont?,textcolor: UIColor?,bgColor: UIColor?) -> UITextField {
    let textfiled = UITextField.init()
    textfiled.frame=frame ?? .zero
    textfiled.placeholder=placeholder ?? ""
    textfiled.textColor=textcolor ?? UIColor.black
    textfiled.font=font
    textfiled.backgroundColor=bgColor ?? UIColor.clear
    textfiled.textAlignment=Alignment ?? .left
    return textfiled
}


