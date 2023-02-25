//
//  ShareViewController.swift
//  ZYFComponentTool_Example
//
//  Created by 幸荟 on 2023/2/24.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class ShareViewController: ZYFBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(shareBut)
        shareBut.snp.makeConstraints { make in
            make.left.equalTo(100)
            make.top.equalTo(200)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        /*
         1. pod 'UMCommon'#//原为'UMCCommon'
            pod 'UMDevice'
                   #分享用
            pod 'UMShare/Social/WeChat'    如果还有集成 抖音  qq 或者微博   pod对应子组件
         2.注册 友盟 填写对应  key
         2. 白名单 Queried URL Schemes    微信 对应  wechat   weixin
         */
        
        
    }
    @objc func shareAction(){
        
    }

    lazy var shareBut: UIButton={
        let but = ZYFCreateTitleButton(frame: .zero, text: "分享微信", bgcolor: .red, textcolor: .white, font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 14), Alignment: .center, offset: 0, target: self, action: #selector(shareAction))
        return but
    }()

}
