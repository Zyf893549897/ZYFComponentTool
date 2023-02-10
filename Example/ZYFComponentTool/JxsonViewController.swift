//
//  JxsonViewController.swift
//  ZYFComponentTool_Example
//
//  Created by 幸荟 on 2023/2/10.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class JxsonViewController: ZYFBaseViewController,JXCategoryListContentViewDelegate {
    func listView() -> UIView! {
        return view
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        gk_navigationBar.isHidden = true
    }
    

  

}
