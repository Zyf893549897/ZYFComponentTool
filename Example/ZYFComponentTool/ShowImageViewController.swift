//
//  ShowImageViewController.swift
//  ZYFComponentTool_Example
//
//  Created by mac on 2023/4/21.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class ShowImageViewController: UIViewController {
    let arr: Array = ["http://miguo-wuhan.oss-cn-hangzhou.aliyuncs.com/20230421/dd80db1b39b32b6f5a9786c155287cb5.jpg",
                      "http://miguo-wuhan.oss-cn-hangzhou.aliyuncs.com/20230421/24c7bd773f597d07d672a0a4baa956b0.jpg",
                      "http://miguo-wuhan.oss-cn-hangzhou.aliyuncs.com/20230421/24c7bd773f597d07d672a0a4baa956b0.jpg"]
    override func viewDidLoad() {
        super.viewDidLoad()

        self.gk_navTitle = "图片展示"
        view.backgroundColor = .white
        
        for index in 0..<3{
            let img = ZYFCreatImageView(frame: CGRect(x: (index+1)*(50 + 10), y: 100, width: 50, height: 50), imgName: "", bgcolor: .red, radius: 0)
            img.zyf_setImage(urlstr: arr[index], placehoder: "")
            img.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
            img.addGestureRecognizer(tap)
            view.addSubview(img)
        }
        
    }
    @objc func tapAction(tapV: UITapGestureRecognizer){
        let tag = tapV.view?.tag
        let v = tapV.view?.viewWithTag(tag ?? 0) ?? UIView()
        ZYFTools.showImage(arr, andIndex: tag ?? 0, andSourceFrame: v)
    }
    

}
