//
//  ViewController.swift
//  ZYFComponentTool
//
//  Created by 张云飞 on 09/06/2022.
//  Copyright (c) 2022 张云飞. All rights reserved.
//

import UIKit
import ZYFComponentTool
class ViewController: ZYFBaseViewController {
    var tableView: UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView.init(frame: .zero, style: .grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView!)
        tableView!.snp.makeConstraints { make in
            make.top.equalTo(gk_navigationBar.snp.bottom)
            make.left.right.bottom.equalTo(0)
        }
    }
    
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(UITableViewCell.self)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "带收尾提示的  textview"
        case 1:
            cell.textLabel?.text = "button 相关工具的使用"
        case 2:
            cell.textLabel?.text = "label 相关工具的使用"
        case 3:
            cell.textLabel?.text = "基类 ZYFBaseViewController 使用（上下拉刷新  无数据页面）"
        case 4:
            cell.textLabel?.text = "分页控制器 组件"
        case 5:
            cell.textLabel?.text = "轮播图"
        case 6:
            cell.textLabel?.text = "pop"
        default:
            break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let vc = TextViewController.init()
            zyf_pushVC(vc: vc, animated: true)
        case 1:
            let vc = ButtonTestViewController.init()
            zyf_pushVC(vc: vc, animated: true)
        case 2:
            let vc = LabelTextViewController.init()
            zyf_pushVC(vc: vc, animated: true)
        case 3:
            let vc = BaseVCTestViewController.init()
            zyf_pushVC(vc: vc, animated: true)
        case 4:
            let vc = JxPageRootViewController.init()
            zyf_pushVC(vc: vc, animated: true)
        case 5:
            let vc = BanneViewController.init()
            zyf_pushVC(vc: vc, animated: true)
        case 6:
            let vc = PopTestViewController.init()
            zyf_pushVC(vc: vc, animated: true)
            
        default:
            let vc = TextViewController.init()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            break
        }
    }
    
}
