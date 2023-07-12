//
//  JxPageRootViewController.swift
//  ZYFComponentTool_Example
//
//  Created by 张云飞 on 2023/2/10.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class JxPageRootViewController: ZYFBaseViewController {
    var indexPage: Int = 0
    var titleArr = ["直购券","抵扣券","专享券","套餐券"]
    var categoryView: JXCategoryTitleView?
    var listContainerView: JXCategoryListContainerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //titileView
        categoryView=JXCategoryTitleView.init(frame: CGRect(x: 0, y: ZYF_NavHeight, width: ZYFScreenWidth, height: zScale(43)))
        categoryView?.backgroundColor = .blue
        categoryView?.titles = titleArr
        categoryView?.isTitleLabelZoomEnabled = true
        categoryView?.titleColor = .red
        categoryView?.isTitleColorGradientEnabled = true
        categoryView?.titleFont = UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 12)
        categoryView?.titleSelectedColor = .orange
        categoryView?.titleSelectedFont = UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 14)
        categoryView?.delegate=self
        categoryView?.defaultSelectedIndex = indexPage
        view.addSubview(categoryView!)
        //指示器
        let lineView = JXCategoryIndicatorLineView.init()
        lineView.indicatorColor = .red
        lineView.indicatorWidth = zScale(40)
        categoryView?.indicators = [lineView]
        //容器控制器
        listContainerView = JXCategoryListContainerView.init(type: .scrollView, delegate: self)
        view.addSubview(listContainerView!)
        categoryView?.listContainer = listContainerView
        listContainerView?.snp.makeConstraints({ make in
            make.top.equalTo(categoryView!.snp.bottom)
            make.left.right.bottom.equalTo(0)
        })
    }


}
extension JxPageRootViewController:JXCategoryViewDelegate, JXCategoryListContainerViewDelegate{
    func number(ofListsInlistContainerView listContainerView: JXCategoryListContainerView!) -> Int {
        return titleArr.count
    }
    func listContainerView(_ listContainerView: JXCategoryListContainerView!, initListFor index: Int) -> JXCategoryListContentViewDelegate! {
        let vc = JxsonViewController.init()

        return vc
    }
    func categoryView(_ categoryView: JXCategoryBaseView!, didSelectedItemAt index: Int) {
        
    }
}
