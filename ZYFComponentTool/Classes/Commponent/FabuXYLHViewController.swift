////
////  FabuXYLHViewController.swift
////  QJB-Merchant
////
////  Created by 张云飞 on 2022/12/5.
////
//
//import UIKit
//
//class FabuXYLHViewController: ZYFBaseViewController,JXCategoryListContentViewDelegate {
//    var picArr: Array = Array<UIImage>.init()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.addSubview(creatTableView(style: .grouped))
//        baseTableView?.delegate=self
//        baseTableView?.dataSource=self
//        baseTableView?.snp.makeConstraints({ make in
//            make.left.right.bottom.equalTo(0)
//            make.top.equalTo(0)
//            make.bottom.equalTo(-ZYF_tabBarHeight)
//        })
//    }
//    
//    func listView() -> UIView! {
//        return view
//    }
//    
//}
//extension FabuXYLHViewController:UITableViewDelegate,UITableViewDataSource{
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return nil
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 0.01
//    }
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        return nil
//    }
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0.01
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(SelectImageTableViewCell.self)
//        if indexPath.row == 0{
//            cell.seleImageView.picArr = picArr
//        }else{
//            cell.seleImageView.picArr = []
//        }
//        cell.seleImageView.index = indexPath
//        cell.seleImageView.setViewsMessage()
//        cell.seleImageView.maxImage = 6
//        cell.seleImageView.selecImageblock = {[weak self] imgA,indx in
//            if indx.row == 0{
//                self?.picArr = imgA
//            }
//            self?.baseTableView?.refreshTableCellHeight()
//        }
//        
////        cell.setViewsMess()
//        return cell
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//    }
//}
