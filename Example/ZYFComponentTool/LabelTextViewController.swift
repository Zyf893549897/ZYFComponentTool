//
//  LabelTextViewController.swift
//  ZYFComponentTool_Example
//
//  Created by 张云飞 on 2023/2/9.
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
        
        //可折叠的  lable
        zelabel.setAttrText(attr: "lable功能啊海口市大富科技\n啊哈        上岛咖啡哈克斯答复哈可视电话lable功能啊海口市大富科技啊哈上岛咖啡哈克斯答复哈可视电话l\n\n\nable功能啊海\n\n\n\n\n口市大富科技啊哈上岛咖啡哈克斯答复哈可视电话lable功能啊海口市大富科技啊哈上岛咖啡哈克斯答复哈可视电话lable功能啊海口市大富科技啊哈上岛咖啡哈克斯答复哈可视电话lable功能啊海口市大富科技啊哈上岛咖啡哈克斯答复哈可视电话lable功能啊海口市大富科技啊哈上岛咖啡哈克斯答复哈可视电话", showAll: false, isAttstr: false) {[weak self] isze in
            self?.zelabel.numberOfLines = isze == true ? 0:4
        }
        view.addSubview(zelabel)
        zelabel.snp.makeConstraints { make in
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.top.equalTo(lable.snp.bottom).offset(50)
        }
        
    }
    
    lazy var lable: UILabel={
        let label = ZYFCreatLable(frame: .zero, text: nil, textcolor: .white, Alignment: .left, font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 14), bgcolor: .clear, num: 0)
        return label
    }()
    
    lazy var zelabel: ZYFFoldLabel={
        let label = ZYFFoldLabel.init(maxLines: 4)
        label.myfont = UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 16)
        return label
    }()
    
}
