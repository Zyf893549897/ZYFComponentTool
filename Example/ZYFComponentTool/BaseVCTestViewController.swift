//
//  BaseVCTestViewController.swift
//  ZYFComponentTool_Example
//
//  Created by 幸荟 on 2023/2/10.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class BaseVCTestViewController: ZYFBaseViewController {

    var dataArr = Array<Any>.init()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(creatTableView(style: .grouped))
        baseTableView?.delegate = self
        baseTableView?.dataSource = self
        view.addSubview(baseTableView!)
        baseTableView!.snp.makeConstraints { make in
            make.top.equalTo(gk_navigationBar.snp.bottom)
            make.left.right.bottom.equalTo(0)
        }
        
        //添加上下拉刷新
        addUpAndDownRefresh()
        getDateRequst(remove: true)
    }
   //下拉刷新
    override func downloadMoreData() {
        super.downloadMoreData()
        getDateRequst(remove: true)
    }
    //上拉加载更多
    override func uploadNewData() {
        super.uploadNewData()
        getDateRequst(remove: false)
    }
    
    func getDateRequst(remove: Bool){
        //模拟网络请求
        timeDelay(1) {
            self.endRefresh()//结束刷新
            if (1==1){
                self.noMoreDate() //没有更多数据
            }
        }
    }

}
extension BaseVCTestViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0//10 //cell 为 0 时显示无数据
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(UITableViewCell.self)
        cell.backgroundColor = .gray
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
       
    }
    
}
