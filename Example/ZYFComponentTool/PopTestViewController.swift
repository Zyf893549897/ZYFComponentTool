//
//  PopTestViewController.swift
//  ZYFComponentTool_Example
//
//  Created by 幸荟 on 2023/2/10.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class PopTestViewController: ZYFBaseViewController {

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
    }
    



}
extension PopTestViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(UITableViewCell.self)
        cell.backgroundColor = .gray
        cell.textLabel?.text = "\(indexPath.row)"
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "自定义 pop\(indexPath.row)"
        case 1:
            cell.textLabel?.text = "自定义 pop\(indexPath.row)"
        case 2:
            cell.textLabel?.text = "LSTPopView 的使用"
        case 3:
            cell.textLabel?.text = "系统 alert 的使用"
        case 4:
            cell.textLabel?.text = ""
        case 5:
            cell.textLabel?.text = ""
        case 6:
            cell.textLabel?.text = ""
        default:
            break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let pop = ZYFPopView.init(frame: ZYFScreenBounds)
            pop.titleLabel.text = "提示"
            pop.mesLabel.text = "阿很快收到货发可接受的饭卡啊上岛咖啡哈可接受的发卡机东方航空久啊稍等哈发卡机阿好哒会计法哈哈"
            pop.defaultStyleLayout()
            pop.showPop()
            break
        case 1:
            let pop = ZYFPopView.init(frame: ZYFScreenBounds)
            pop.mesLabel.text = "阿很快收到货发可接受的饭卡啊上岛咖啡哈可接受的发卡机东方航空久啊稍等哈发卡机阿好哒会计法哈哈"
            pop.onlyMesLayout()
            pop.cj_showInAppWindowAnimation()
            break
        case 2:
            let pop = UIView.init(frame: CGRect(x: 0, y: 0, width: scale(278), height: scale(231)))
            pop.backgroundColor = .red
            let rootPop = LSTPopView.initWithCustomView(pop, popStyle: .scale, dismissStyle: .scale)
            rootPop?.hemStyle = .center
            rootPop?.isClickBgDismiss = true //击背景是否移除弹窗
//            pop.blcok = {[weak rootPop] in
//                rootPop?.dismiss()
//            }
            rootPop?.pop()
            break
        case 3:
            let alertVC = UIAlertController.init(title: "", message: "", preferredStyle: .actionSheet)
            let alerA = UIAlertAction.init(title: "按键1", style: .cancel) //加粗
            alertVC.addAction(alerA)
            let alerB = UIAlertAction.init(title: "按键2", style: .default)
            alertVC.addAction(alerB)
            let alerC = UIAlertAction.init(title: "按键3", style: .destructive)//红色
            alertVC.addAction(alerC)
            self.present(alertVC, animated: true)
            break
        case 4:
            break
        case 5:
            break
        case 6:
            break
        default:
            break
        }
    }
    
}
