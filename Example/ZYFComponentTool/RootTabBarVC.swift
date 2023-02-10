//
//  RootTabBarVC.swift
//  QJBMerchants
//
//  Created by 幸荟 on 2022/10/10.
//

import UIKit
import YYKit
class RootTabBarVC: UITabBarController, AxcAE_TabBarDelegate {
    var lastIdx = 0//记录上次的选择
    
    let axcTabBar = AxcAE_TabBar.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addChildViewControllers()
    }
    
    func addChildViewControllers(){
        let navHome = UINavigationController.rootVC(ViewController.init())
        let navdataBoard = UINavigationController.rootVC(TowViewController.init())
        let nav = UINavigationController.rootVC(ThreeViewController.init())
        let navDetail = UINavigationController.rootVC(FourViewController.init())
        let navCenter = UINavigationController.rootVC(FiveViewController.init())
        let arr = [["nolImg":"hoem_nol","selectImg":"hoem_sele","title":"首页"],
                   ["nolImg":"data_nol","selectImg":"data_sele","title":"数据看板"],
                   ["nolImg":"saoma","selectImg":"saoma","title":""],
                   ["nolImg":"mx_nol","selectImg":"mx_sele","title":"核销明细"],
                   ["nolImg":"center_nol","selectImg":"center_sele","title":"商户中心"]]
        
        var tabBarConfs = Array<AxcAE_TabBarConfigModel>.init()
        for (index,dic) in arr.enumerated() {
            let md = AxcAE_TabBarConfigModel.init()
            md.itemTitle=dic["title"]
            md.selectImageName=dic["selectImg"]
            md.normalImageName=dic["nolImg"]
            md.normalColor = HexColorstr(hexstr: "#C7C4C4")
            md.selectColor = HexColorstr(hexstr: "#C6A662")
            if index == 2 {
                md.bulgeStyle = .circular
                md.itemLayoutStyle = .picture
                md.backgroundImageView.backgroundColor = .white
                md.bulgeHeight = 20
            }
            tabBarConfs.append(md)
        }
        viewControllers = [navHome,navdataBoard,nav,navDetail,navCenter]
        axcTabBar.tabBarConfig = tabBarConfs
        axcTabBar.delegate=self
        axcTabBar.backgroundColor = .white
        tabBar.addSubview(axcTabBar)
        
       //去掉顶部 黑线
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance.init()
            appearance.backgroundColor = .white
            appearance.shadowColor = .clear
            tabBar.scrollEdgeAppearance = appearance
            tabBar.standardAppearance = appearance
        } else {
            tabBar.shadowImage = UIImage.init(color: .clear)
            tabBar.backgroundImage = UIImage.init(color: .white)
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        axcTabBar.frame = tabBar.bounds
        axcTabBar.viewDidLayoutItems()
    }
//MARK: --------代理--------
    func axcAE_TabBar(_ tabbar: AxcAE_TabBar!, select index: Int) {
        if index == 2{
            axcTabBar.setSelect(lastIdx, withAnimation: false)
            present(UIViewController.init(), animated: true, completion: nil)
        }else{
            selectedIndex=index
            axcTabBar.selectIndex=index
            lastIdx = index
        }
    }
}

