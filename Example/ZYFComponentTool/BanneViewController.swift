//
//  BanneViewController.swift
//  ZYFComponentTool_Example
//
//  Created by 幸荟 on 2023/2/10.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import FSPagerView
class BanneViewController: ZYFBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(creatTableView(style: .grouped))
        baseTableView?.delegate = self
        baseTableView?.dataSource = self
        baseTableView?.tableHeaderView = pagerViewA
        baseTableView?.register(BannerTableViewCell.self)
        view.addSubview(baseTableView!)
        baseTableView!.snp.makeConstraints { make in
            make.top.equalTo(gk_navigationBar.snp.bottom)
            make.left.right.bottom.equalTo(0)
        }
        
        
        pagerViewA.addSubview(pagerControl)
        pagerControl.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-10)
        }
    }
    // 懒加载滚动图片浏览器
    lazy var pagerViewA : FSPagerView = {
        let pagerView = FSPagerView.init(frame: CGRect(x: 0, y: 0, width: ZYFScreenWidth, height: 300))
        pagerView.delegate = self
        pagerView.dataSource = self
        pagerView.scrollDirection = .vertical //滚动方向
        pagerView.automaticSlidingInterval =  0 //间隔时间  为0时 不自动滚动
        pagerView.isInfinite = true //是否无效循环
//        pagerView.itemSize = CGSize(width: 200, height: 250)
        pagerView.interitemSpacing = 10 //图片之间 间隙
//        pagerView.transformer = FSPagerViewTransformer.init(type: .zoomOut) //动画样式
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "ShopBannerCell")
        return pagerView
    }()
    // 懒加载滚动图片浏下标
    lazy var pagerControl:FSPageControl = {
        let pageControl = FSPageControl()
        //设置下标的个数
        pageControl.numberOfPages = 3
        //设置下标位置
        pageControl.contentHorizontalAlignment = .center
        //设置下标指示器边框颜色（选中状态和普通状态）
        pageControl.setStrokeColor(.clear, for: .normal)
        pageControl.setStrokeColor(.clear, for: .selected)
        //设置下标指示器颜色（选中状态和普通状态）
        pageControl.setFillColor(.red, for: .normal)
        pageControl.setFillColor(.white, for: .selected)
        pageControl.interitemSpacing = 15
        pageControl.setPath(UIBezierPath.init(roundedRect: CGRect.init(x: 0, y: 0, width: 15, height: 3),cornerRadius: 1), for: .normal)
        pageControl.setPath(UIBezierPath.init(roundedRect: CGRect.init(x: 0, y: 0, width: 15, height: 3),cornerRadius: 1), for: .selected)
        return pageControl
    }()

}
extension BanneViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(BannerTableViewCell.self)
            cell.backgroundColor = .gray
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(UITableViewCell.self)
            cell.backgroundColor = .gray
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
       
    }
    
}
extension BanneViewController: FSPagerViewDelegate, FSPagerViewDataSource {
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 3
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "ShopBannerCell", at: index)
        cell.imageView?.image = UIImage(named: "\(index+1)")
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {

    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pagerControl.currentPage = targetIndex
    }
}
