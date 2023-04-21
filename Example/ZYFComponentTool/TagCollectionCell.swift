//
//  TagCollectionCell.swift
//  QJB-iOS
//
//  Created by 张云飞 on 2023/2/13.
//

import UIKit

class TagCollectionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViewsLayout()
    }
    lazy var tagBut: UIButton={
        let but = ZYFCreateButton(frame: .zero, text: "", bgcolor: .white, textcolor: HexColorstr(hexstr: "#000000",alpha: 0.85), font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 12), Alignment: .center, imgName: "", isbg: false, imgStyle: nil, space: 0, offset: 0, target: nil, action: nil)
        but.isUserInteractionEnabled = false
        return but
    }()
    func setViewsLayout(){
        self.setLayer(scale(14), 0, .clear)
        addSubview(tagBut)
        
        tagBut.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
