//
//  TextFieldViewController.swift
//  ZYFComponentTool_Example
//
//  Created by mac on 2023/4/17.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit


class TextFieldViewController: ZYFBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gk_navTitle = ""
        view.backgroundColor = .white
        view.addSubview(textField)
        
        textField.snp.makeConstraints { make in
            make.left.equalTo(zScale(10))
            make.top.equalTo(zScale(100))
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
    }

    
    lazy var textField: RestrictedInputTextField={
        let text = RestrictedInputTextField.init(keyBoardStye: .default)
        text.backgroundColor = .orange
        text.type = .restricted_phone;
        //值的回传 记得 要结束编辑
        text.block = {[weak self] str in
            print("===s=====\(str)==")
        }
        return text
    }()

}
