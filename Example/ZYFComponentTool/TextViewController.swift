//
//  TextViewController.swift
//  ZYFComponentTool_Example
//
//  Created by 幸荟 on 2023/1/5.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class TextViewController: ZYFBaseViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        view.backgroundColor = .white

        view.addSubview(textV)
        view.addSubview(but)
        textV.snp.makeConstraints { make in
            make.left.equalTo(40)
            make.top.equalTo(gk_navigationBar.snp.bottom)
            make.width.equalTo(scale(200))
            make.height.greaterThanOrEqualTo(100)
        }
        but.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.top.equalTo(500)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
        }
        
    }
    lazy var but: UIButton={
        let but = ZYFCreateButton(frame: .zero, text: "hasdf", bgcolor: .white, textcolor: .red, font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 20), Alignment: .center, imgName: "", isbg: false, imgStyle: img_Left, space: 0, offset: 0, target: self, action: #selector(butAction))
        return but
    }()
    lazy var textV: ZYFPlaceholderTextView={
        let view = ZYFPlaceholderTextView.init()
        view.textView.isScrollEnabled = false
        view.setLayer(2, 1, .red)
        view.maxLength = 30
        view.showFootNumber=true
        view.placeholder = "请输入"
        view.textView.font = UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 16)
        view.placeholderFont = UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 16)
        view.addTextDidChangeHandler { str in
            print("=====\(str ?? "")")
        }
        view.addTextLengthDidMaxHandler { str in
            print("======max======")
        }
        return view
    }()
  
    @objc func butAction(){
       
    }
}
