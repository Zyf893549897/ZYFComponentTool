//
//  ButtonTestViewController.swift
//  ZYFComponentTool_Example
//
//  Created by 幸荟 on 2023/2/9.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class ButtonTestViewController: ZYFBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(but)
        but.snp.makeConstraints { make in
            make.left.equalTo(60)
            make.top.equalTo(200)
            make.width.height.equalTo(100)
        }
        
        
    }
    
    lazy var but: UIButton={
        let but = ZYFCreateButton(frame: .zero, text: "按键按键", bgcolor: .orange, textcolor: .blue, font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 16), Alignment: .center, imgName: "yuan", isbg: false, imgStyle: img_Top, space: 10, offset: 0, target: nil, action: nil)
        //通过 runtime 添加的 属性
        but.title = "aaaa"
        but.indexPath = IndexPath.init(row: 0, section: 0)
        but.index = 1
        return but
    }()
}
