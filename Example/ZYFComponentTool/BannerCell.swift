//
//  BannerCell.swift
//  ZYFComponentTool_Example
//
//  Created by 幸荟 on 2023/2/10.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class BannerCell: FSPagerViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViewsLayout()
    }
    lazy var bgview: UIView={
        let view = ZYFCreateView(frame: .zero, bgcolor: .red, radius: 0)
        return view
    }()
    lazy var imgView: UIImageView={
        let imgV = ZYFCreatImageView(frame: .zero, imgName: "", bgcolor: .white, radius: 0)
        return imgV
    }()
    lazy var titleBale: UILabel={
        let label = ZYFCreatLable(frame: .zero, text: "asdfasd", textcolor: .orange, Alignment: .center, font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 14), bgcolor: .clear, num: 1)
        return label
    }()
    func setViewsLayout(){
        addSubview(bgview)
        bgview.addSubview(imgView)
        bgview.addSubview(titleBale)
        
        bgview.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
        
        imgView.snp.makeConstraints { make in
            make.left.top.equalTo(0)
            make.width.height.equalTo(200)
        }
        titleBale.snp.makeConstraints { make in
            make.top.equalTo(imgView.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.height.equalTo(20)
            make.bottom.equalTo(-10)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
