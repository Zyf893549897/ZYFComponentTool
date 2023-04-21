//
//  TagViewController.swift
//  ZYFComponentTool_Example
//
//  Created by 张云飞 on 2023/2/14.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class TagViewController: ZYFBaseViewController,ZYFSearchBoxDelegate {
    
    func fetchBackString(str: String) {
        
    }
    
    var hiestArr = Array<String>.init()
    var searchView: ZYFSearchView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchView?.isHidden = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchView?.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        hiestArr = ["历史","电视机","小米手机","macBook","电视北京站","阿克苏对接焊缝卡","哈哈","aaa","好卡收到会计法","历史"]
        
        
        
        view.addSubview(creatTableView(style: .grouped))
        baseTableView?.delegate = self
        baseTableView?.dataSource = self
        view.addSubview(baseTableView!)
        baseTableView!.snp.makeConstraints { make in
            make.top.equalTo(gk_navigationBar.snp.bottom)
            make.left.right.bottom.equalTo(0)
        }
          
        searchView = ZYFSearchView.init(frame: .zero)
        searchView?.delegate=self
        searchView?.setLayer(16, 0, .clear)
        gk_navTitleView = searchView // 在设置 navTitleView 时 自定义的 view 需要给定 宽高。   放在其他地方时 正常布局代码即可
//        searchView!.snp.makeConstraints { make in
//            make.left.equalTo(50)
//            make.right.equalTo(-16)
//            make.top.equalTo(10)
//            make.height.equalTo(32)
//        }
        
        timeDelay(0.1) {[weak self] in
            self?.baseTableView?.reloadData()
        }
    }
    

  
}
extension TagViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(TagCell.self)
        cell.setViewsMessage(arr: hiestArr,table: tableView,indx: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
