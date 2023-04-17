//
//  RefrashViewController.swift
//  ZYFComponentTool_Example
//
//  Created by mac on 2023/4/17.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class RefrashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        gk_navTitle = ""
        
        view.backgroundColor=UIColor.white
        
        view.addSubview(table)
        table.addUpAndDownRefresh()
        
        table.snp.makeConstraints { make in
            make.top.equalTo(gk_navigationBar.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    func getDateRequst(remove: Bool){
        print("=======\(table.page_no)")
        //模拟网络请求
        timeDelay(1) {[weak self] in
            self?.table.endRefresh()//结束刷新
            if (1==1){
                self?.table.noMoreDate() //没有更多数据
            }
        }
    }
    
    lazy var table: UITableView={
        let table = UITableView.init(frame: CGRect.zero, style: .grouped)
        table.backgroundColor=UIColor.clear
        table.tableFooterView=UIView.init()
        table.tableHeaderView=UIView.init(frame: CGRect(x: 0, y: 0, width: ZYFScreenWidth, height: CGFloat.leastNormalMagnitude))
        table.separatorStyle = .none
        if #available(iOS 15.0, *){
            table.sectionHeaderTopPadding = 0
        }
        table.delegate=self
        table.dataSource=self
        table.refrashDelegate=self
        return table
    }()

}
extension RefrashViewController: RefreshNodataDelegate{
    func uploadNewDataAction() {
        getDateRequst(remove: false)
    }
    func downloadMoreDataAction() {
        getDateRequst(remove: true)
    }
}
extension RefrashViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0 //cell 为 0 时显示无数据
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
