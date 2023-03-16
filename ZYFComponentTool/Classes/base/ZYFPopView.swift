//
//  ZYFFootButBasePopView.swift
//  QJBSH
//
//  Created by 幸荟 on 2022/10/19.
//

import UIKit

open class ZYFPopView: ZYFBasePopView {
    @objc var block: ReturnIndexBlock?
    public override init(frame: CGRect) {
        super.init(frame: frame)
        bgView.addSubview(titleLabel)
        bgView.addSubview(mesLabel)
        bgView.addSubview(cancelBut)
        bgView.addSubview(sureBut)
    }
    @objc public lazy var titleLabel: UILabel={
        let label = ZYFCreatLable(frame: CGRect.zero, text: "", textcolor: UIColor.colorHexColorstring("#333333"), Alignment: .center, font: UIFont.setFontStlye(style: .PingFang_SC_Medium, scaleFontSize: 20), bgcolor: .clear, num: 1)
        return label
    }()
    @objc public lazy var mesLabel: UILabel={
        let label = ZYFCreatLable(frame: CGRect.zero, text: "", textcolor: UIColor.colorHexColorstring("#333333"), Alignment: .center, font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 14), bgcolor: .clear, num: 0)
        return label
    }()
    @objc public lazy var cancelBut: UIButton={
        let but = ZYFCreateTitleButton(frame: CGRect.zero, text: "取消", bgcolor: UIColor.colorHexColorstring("#F9F3E3"), textcolor: .gray, font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 16.0), Alignment: .center, offset: 0, target: self, action: #selector(cancelButAciton))
        but.setlayerRadius(8, andBorderwidth: 0, andBorderColor: .clear)
        return but
    }()
    @objc public lazy var sureBut: UIButton={
        let but = ZYFCreateTitleButton(frame: CGRect.zero, text: "确定", bgcolor: .red, textcolor: .white, font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 16), Alignment: .center, offset: 0, target: self, action: #selector(sureButAciton))
        but.setlayerRadius(8, andBorderwidth: 0, andBorderColor: .clear)
        return but
    }()
    @objc func cancelButAciton(but: UIButton){
        if block != nil{
            block?(0)
        }
        dismiss()
    }
    @objc func sureButAciton(but: UIButton){
        if block != nil{
            block?(1)
        }
        dismiss()
    }
    public func showPop(){
        self.cj_showInAppWindowAnimation()
    }
   @objc public func defaultStyleLayout(){
        super.setViewsLayout()
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.top.equalTo(scale(18))
        }
        mesLabel.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        cancelBut.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.bottom.equalTo(-scale(20))
            make.width.equalTo(scale(110))
            make.top.equalTo(mesLabel.snp.bottom).offset(25)
            make.height.equalTo(scale(44))
        }
        sureBut.snp.makeConstraints { make in
            make.right.equalTo(-16)
            make.bottom.equalTo(-scale(20))
            make.width.equalTo(scale(110))
            make.top.equalTo(mesLabel.snp.bottom).offset(25)
            make.height.equalTo(scale(44))
        }
    }
    
    @objc public func onlyMesLayout(){
        super.setViewsLayout()
        mesLabel.snp.remakeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.top.equalTo(scale(18))
            make.bottom.equalTo(-scale(20))
        }
    }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
