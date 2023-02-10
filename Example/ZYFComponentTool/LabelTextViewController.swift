//
//  LabelTextViewController.swift
//  ZYFComponentTool_Example
//
//  Created by 幸荟 on 2023/2/9.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class LabelTextViewController: ZYFBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(lable)
        lable.snp.makeConstraints { make in
            make.left.equalTo(50)
            make.top.equalTo(200)
            make.width.equalTo(200)
            
        }
        
        //lable  字体颜色
        lable.attributedText = ZYFTools.getAttributeWith(["张云飞","功"], addline: false, alignment: .right, addSpacing: 10, string: "张云飞测试lable功能啊海口市大富科技啊哈上岛咖啡哈克斯答复哈可视电话付款", orginFont: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 14), orginColor: .red, attributeFont: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 14), attributeColors: [HexColorstr(hexstr: "#00B578")])
        //添加点击事件
        lable.enabledTapEffect = false //是否有点击效果
        lable.yb_addAttributeTapAction(with: ["张云飞","功"]) { lab, str, range, indx in
            print("====\(lab)===\(str)===\(range)===\(indx)")
        }
        
    }
    
    lazy var lable: UILabel={
        let label = ZYFCreatLable(frame: .zero, text: nil, textcolor: .white, Alignment: .left, font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 14), bgcolor: .clear, num: 0)
        return label
    }()

}
