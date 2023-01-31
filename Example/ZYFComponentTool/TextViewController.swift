//
//  TextViewController.swift
//  ZYFComponentTool_Example
//
//  Created by 幸荟 on 2023/1/5.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import ZYFComponentTool
class TextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "textView"
        view.backgroundColor = .white
//        view.addSubview(bgView)
//        bgView.addSubview(textV)
        view.addSubview(textV)
        textV.snp.makeConstraints { make in
            make.left.equalTo(40)
            make.top.equalTo(300)
            make.width.equalTo(scale(200))
            make.height.greaterThanOrEqualTo(100)
        }
//        textV.snp.makeConstraints { make in
//            make.left.equalTo(10)
//            make.top.equalTo(0)
//            make.right.equalTo(-10)
//            make.bottom.equalTo(-10)
//        }
        
    }
//    lazy var bgView: UIView={
//        let view = ZYFCreateView(frame: .zero, bgcolor: .blue, radius: 0)
//        return view
//    }()
//    lazy var textV: ZYFTextView={
//        let view = ZYFTextView.init()
//        view.isScrollEnabled = false
//        view.setLayer(2, 1, .red)
//        view.maxLength = 1000
//        view.showFootNumber=true
//        view.placeholder = "请输入"
//        view.placeholderColor = .red
//        view.font = UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 16)
//        view.placeholderFont = UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 16)
//        return view
//    }()
    lazy var textV: ZYFPlaceholderTextView={
        let view = ZYFPlaceholderTextView.init()
        view.textView.isScrollEnabled = false
        view.setLayer(2, 1, .red)
        view.maxLength = 1000
//        view.showFootNumber=true
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

}
