//
//  ZYFFootButBasePopView.swift
//  QJBSH
//
//  Created by 幸荟 on 2022/10/19.
//

import UIKit

class ZYFFootButBasePopView: ZYFBasePopView {
    @objc var block: ReturnIndexBlock?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViewsLayout()
    }
    @objc lazy var titleLabel: UILabel={
        let label = ZYFCreatLable(frame: CGRect.zero, text: "", textcolor: UIColor.ColorHexColorstring("#333333"), Alignment: .center, font: UIFont.setFontStlye(style: .PingFang_SC_Medium, scaleFontSize: 20), bgcolor: .clear, num: 1)
        return label
    }()
    
    @objc lazy var cancelBut: UIButton={
        let but = ZYFCreateTitleButton(frame: CGRect.zero, text: "取消", bgcolor: UIColor.ColorHexColorstring("#F9F3E3"), textcolor: .gray, font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 16.0), Alignment: .center, offset: 0, target: self, action: #selector(cancelButAciton))
        but.setlayerRadius(8, andBorderwidth: 0, andBorderColor: .clear)
        return but
    }()
    @objc lazy var sureBut: UIButton={
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
    override func setViewsLayout(){
        super.setViewsLayout()
        
        bgView.addSubview(titleLabel)
        bgView.addSubview(cancelBut)
        bgView.addSubview(sureBut)
        
        titleLabel.snp.makeConstraints { make in
            make.left.right.equalTo(0)
            make.top.equalTo(scale(18))
            make.height.equalTo(scale(24))
        }
        cancelBut.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.bottom.equalTo(-scale(20))
            make.width.equalTo(scale(110))
            make.height.equalTo(scale(44))
        }
        sureBut.snp.makeConstraints { make in
            make.right.equalTo(-16)
            make.bottom.equalTo(-scale(20))
            make.width.equalTo(scale(110))
            make.height.equalTo(scale(44))
        }
    }
    
    @objc func noTittleLayout(){
        titleLabel.snp.remakeConstraints { make in
            make.left.right.equalTo(0)
            make.top.equalTo(scale(18))
            make.height.equalTo(scale(10))
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
