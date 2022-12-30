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
    var blackView: UIView?

    public override init(frame: CGRect){
        super.init(frame: frame)
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
    }

    //创建按键
     public func creatViews(mesArr: Array<String>){
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(removeViewAction))
        tap.delegate = self
        addGestureRecognizer(tap)
        
        blackView=UIView.init(frame: CGRect(x: 0, y: ZYFScreenHeight - CGFloat(50*mesArr.count) - 60.0 - ZYF_BottomSafeAreaHeight, width: ZYFScreenWidth, height: CGFloat(50*mesArr.count) + 60.0 + ZYF_BottomSafeAreaHeight))
        blackView?.backgroundColor = .white
        blackView?.isUserInteractionEnabled = true
        addSubview(blackView!)
        
        blackView?.alpha = 0
        UIView.animate(withDuration: 0.2) {[weak self] in
            self?.blackView?.alpha = 1.0
            self?.backgroundColor = UIColor.ColorHexColorstring("000000", 0.4)//OraHexColor(colorString: "000000", alpha: 0.4)
            self?.layoutIfNeeded()
        }
        
        for (index,title) in mesArr.enumerated(){
            let but = ZYFCreateTitleButton(frame: CGRect(x: 0, y: 50.0*CGFloat(index), width: ZYFScreenWidth, height: 50.0), text: title, bgcolor: .white, textcolor: UIColor.ColorHexColorstring("#00A3E0"), font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 14), Alignment: .center, offset: 0, target: self, action: #selector(butAction(but:)))
            but.tag = index
            if index < mesArr.count{
                let view = UIView.init(frame: CGRect(x: 0, y: but.endY, width: ZYFScreenWidth, height: 0.5))
                if index == (mesArr.count - 1){
                    view.frame=CGRect(x: 0.0, y: but.endY, width: ZYFScreenWidth, height: 0.5)
                }
                view.backgroundColor = UIColor.ColorHexColorstring("#B7B7B7")
                blackView?.addSubview(view)
            }
            blackView?.addSubview(but)
        }
        
         let cancelBut=ZYFCreateTitleButton(frame: CGRect(x: 0, y: 50.0*CGFloat(mesArr.count) + 10.0, width: ZYFScreenWidth, height: 50), text: "取消", bgcolor: .white, textcolor: UIColor.ColorHexColorstring("#B7B7B7"), font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 14), Alignment: .center, offset: 0, target: self, action: #selector(cancelButAction))
    
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
