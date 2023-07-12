//
//  ZYFSheetView.swift
//  Common
//
//  Created by issuser on 2022/3/4.
//

import UIKit
open class ZYFSheetView: UIView, UIGestureRecognizerDelegate {
    public typealias SheetBlock = (Int)->()
    public var block: SheetBlock?
    var titleArr: [String]?
    var blackView: UIView?
    
    let cellheight = zScale(50)
    
    public init(titles: [String]){
        super.init(frame: .zero)
        frame = ZYFScreenBounds
        
        self.isUserInteractionEnabled=true
        UIApplication.shared.keyWindow?.endEditing(true)
        
        let app = UIApplication.shared.delegate
        if app?.window != nil{
            app?.window??.addSubview(self)
        }
        self.alpha = 0
        UIView.animate(withDuration: 0.2) {[weak self] in
            self?.alpha = 1
        }
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(removeViewAction))
        tap.delegate = self
        addGestureRecognizer(tap)
        
        titleArr = titles
        creatViews(mesArr: titles)
    }
    public func show() {
        blackView?.alpha = 0
        UIView.animate(withDuration: 0.2) {[weak self] in
            self?.blackView?.alpha = 1.0
            self?.backgroundColor = UIColor.colorHexColorstring("000000", 0.4)
            self?.blackView?.frame = CGRect(x: 0, y: ZYFScreenHeight - CGFloat((self?.cellheight ?? 0)*CGFloat((self?.titleArr?.count ?? 0))) - (self?.cellheight ?? 0) - ZYF_BottomSafeAreaHeight, width: ZYFScreenWidth, height: CGFloat((self?.cellheight ?? 0)*CGFloat((self?.titleArr?.count ?? 0))) + (self?.cellheight ?? 0) + ZYF_BottomSafeAreaHeight)
            self?.layoutIfNeeded()
        }
        
    }
    
    public func dismis() {
        
        self.removewViews()
    }
    //创建按键
    public func creatViews(mesArr: Array<String>){
        blackView=UIView.init(frame: CGRect(x: 0, y: ZYFScreenHeight+cellheight, width: ZYFScreenWidth, height: CGFloat(cellheight*CGFloat(mesArr.count)) + cellheight + ZYF_BottomSafeAreaHeight))
        blackView?.backgroundColor = .white
        blackView?.isUserInteractionEnabled = true
        addSubview(blackView!)
        
        for (index,title) in mesArr.enumerated(){
            let but = ZYFCreateTitleButton(frame: CGRect(x: 0, y: cellheight*CGFloat(index), width: ZYFScreenWidth, height: cellheight), text: title, bgcolor: .white, textcolor: UIColor.colorHexColorstring("#00A3E0"), font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 14), Alignment: .center, offset: 0, target: self, action: #selector(butAction(but:)))
            but.tag = index
            
            let view = UIView.init(frame: CGRect(x: 0, y: zScale(49), width: ZYFScreenWidth, height: 0.5))
            view.backgroundColor = UIColor.colorHexColorstring("#B7B7B7")
            but.addSubview(view)
            
            blackView?.addSubview(but)
        }
        
        let cancelBut=ZYFCreateTitleButton(frame: CGRect(x: 0, y: cellheight*CGFloat(mesArr.count) + zScale(10), width: ZYFScreenWidth, height: cellheight), text: "取消", bgcolor: .white, textcolor: UIColor.colorHexColorstring("#B7B7B7"), font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 14), Alignment: .center, offset: 0, target: self, action: #selector(cancelButAction))
        
        blackView?.addSubview(cancelBut)
    }
    
    @objc func removeViewAction(){
        self.removewViews()
    }
    
    @objc func butAction(but: UIButton){
        if block != nil{
            block!(but.tag)
        }
        self.removewViews()
    }
    //取消按键
    @objc func cancelButAction(){
        self.removewViews()
    }
    
    //移除视图
    func removewViews(){
        UIView.animate(withDuration: 0.2) {[weak self] in
            self?.alpha = 0
            self?.backgroundColor = UIColor.clear
            self?.blackView?.frame = CGRect(x: 0, y: ZYFScreenHeight+(self?.cellheight ?? 0), width: ZYFScreenWidth, height: CGFloat((self?.cellheight ?? 0)*CGFloat(self?.titleArr?.count ?? 0)) + (self?.cellheight ?? 0) + ZYF_BottomSafeAreaHeight)
        } completion: {[weak self] finished in
            self?.removeFromSuperview()
        }
    }
    
    //tap 代理方法
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.superview?.isDescendant(of: self.blackView ?? UIView())) == true{
            return false
        }
        return true
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
