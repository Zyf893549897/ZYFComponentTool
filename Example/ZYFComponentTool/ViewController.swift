//
//  ViewController.swift
//  ZYFComponentTool
//
//  Created by 张云飞 on 09/06/2022.
//  Copyright (c) 2022 张云飞. All rights reserved.
//

import UIKit
import ZYFComponentTool
class ViewController: UIViewController {
    var tableView: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavStyle(color: .red)
        
        tableView = UITableView.init(frame: .zero, style: .grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView!)
        tableView!.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    //设置导航栏颜色
    open func setNavStyle(color: UIColor,titleColor: UIColor = HexColorstr(hexstr: "#333333")) {
        if #available(iOS 13.0, *) {
            let barApp = UINavigationBarAppearance.init()
            barApp.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
            barApp.backgroundColor = color
            barApp.backgroundEffect = nil
            barApp.shadowImage = UIImage.init()
            barApp.shadowColor = .clear//底部黑线
            navigationController?.navigationBar.scrollEdgeAppearance = barApp
            navigationController?.navigationBar.standardAppearance = barApp
        } else {
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
            navigationController?.navigationBar.setBackgroundImage(UIImage.init(color: color), for: .any, barMetrics: .default)
            navigationController?.navigationBar.shadowImage = UIImage.init()//底部黑线
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
            navigationController?.pushViewController(vc, animated: true)
//            self.present(vc, animated: true)
        default:
            break
        }
    }
    
}
