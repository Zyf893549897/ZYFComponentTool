//
//  SelectImageViewController.swift
//  ZYFComponentTool_Example
//
//  Created by 幸荟 on 2023/2/11.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class SelectImageViewController: ZYFBaseViewController {
    var imgArr = Array<Any>.init()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(creatTableView(style: .grouped))
        baseTableView?.delegate = self
        baseTableView?.dataSource = self
        baseTableView?.register(SelectImageTableViewCell.self)
        view.addSubview(baseTableView!)
        baseTableView!.snp.makeConstraints { make in
            make.top.equalTo(gk_navigationBar.snp.bottom)
            make.left.right.bottom.equalTo(0)
        }
    }
    

 
}
extension SelectImageViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(SelectImageTableViewCell.self)
        cell.seleImageView.picArr = imgArr
        cell.seleImageView.index = indexPath
        cell.seleImageView.setViewsMessage()
        cell.seleImageView.maxImage = 6
        cell.seleImageView.selecImageblock = {[weak self] arr in
            self?.baseTableView?.refreshTableCellHeight()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
       
    }
    
}
