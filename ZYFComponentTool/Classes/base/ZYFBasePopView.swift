//
//  ZYFBasePopView.swift
//  QJBSH
//
//  Created by 张云飞 on 2022/10/19.
//

import UIKit

open class ZYFBasePopView: UIView , UIGestureRecognizerDelegate{

   public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame=ZYFScreenBounds
        
        ZYFApplication.keyWindow?.endEditing(true)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        tap.delegate=self
        addGestureRecognizer(tap)
        
        
        setViewsLayout()
    }
    @objc func tapAction(){
        self.endEditing(true)
        dismiss()
    }
    
    @objc func show(){
        self.layoutIfNeeded()
        UIView.animate(withDuration: 0.2) {[weak self] in
            self?.bgView.alpha = 1.0
            self?.backgroundColor = HexColorstr(hexstr: "000000", alpha: 0.4)
        }
        cj_showInAppWindowAnimation()
    }
    @objc func dismiss(){
        UIView.animate(withDuration: 0.2) {[weak self] in
            self?.alpha = 0
            self?.backgroundColor = .clear
        } completion: {[weak self] finished in
            self?.removeFromSuperview()
        }
    }
    
    lazy var bgView: UIView={
        let view = ZYFCreateView(frame: CGRect.zero, bgcolor: .white, radius: 12)
        return view
    }()
    func setViewsLayout(){
        addSubview(bgView)
        
        bgView.snp.makeConstraints { make in
            make.width.equalTo(ZYFScreenWidth-100)
            make.height.greaterThanOrEqualTo(1)
            make.center.equalTo(center).priority(1000)
        }        
    }
    open override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if ((touch.view?.isDescendant(of: bgView)) == true){
            return false
        }
        return true
    }
    
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
