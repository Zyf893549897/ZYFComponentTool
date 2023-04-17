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
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(UITableViewCell.self)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "带收尾提示的  textview"
        case 1:
            cell.textLabel?.text = "button 相关工具的使用"
        case 2:
            cell.textLabel?.text = "label 相关工具的使用 多颜色  折叠  点击等"
        case 3:
            cell.textLabel?.text = "基类 ZYFBaseViewController（上下拉刷新  无数据页面）"
        case 4:
            cell.textLabel?.text = "UIscollview扩展方式（上下拉刷新  无数据页面）"
        case 5:
            cell.textLabel?.text = "分页控制器 组件"
        case 6:
            cell.textLabel?.text = "轮播图"
        case 7:
            cell.textLabel?.text = "pop"
        case 8:
            cell.textLabel?.text = "图片选择  图片展示 封装"
        case 9:
            cell.textLabel?.text = "存储数据模型  如 用户信息   首页数据缓存等"
        case 10:
            cell.textLabel?.text = "搜索历史 标签"
        case 11:
            cell.textLabel?.text = "瀑布流"
        case 12:
            cell.textLabel?.text = "保存图片功能"
        case 13:
            cell.textLabel?.text = "调用本机地图导航"
        case 14:
            cell.textLabel?.text = "rx的简单使用"
        case 15:
            cell.textLabel?.text = "限制输入的 textfiled"
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
            let vc = RefrashViewController.init()
            zyf_pushVC(vc: vc, animated: true)
        case 5:
            let vc = JxPageRootViewController.init()
            zyf_pushVC(vc: vc, animated: true)
        case 6:
            let vc = BanneViewController.init()
            zyf_pushVC(vc: vc, animated: true)
        case 7:
            let vc = PopTestViewController.init()
            zyf_pushVC(vc: vc, animated: true)
        case 8:
            let vc = SelectImageViewController.init()
            zyf_pushVC(vc: vc, animated: true)
        case 9:
            let vc = SaveModelViewController.init()
            zyf_pushVC(vc: vc, animated: true)
        case 10:
            let vc = TagViewController.init()
            zyf_pushVC(vc: vc, animated: true)
        case 11:
            let vc = WaterfallCollectionViewController.init()
            zyf_pushVC(vc: vc, animated: true)
        case 12:
            saveImageToPhotoAlbum(img: UIImage(named: "duigou") ?? UIImage())
        case 13:
            if ABLocation.isCanLocation() == false{
                ZYFHUD.show(withMessage: "开启定位或者等待定位成功")
                return
            }
            let lociton = ABLocation.shared().lastLocation
            CPMapNavigation.shared().clickGotoMap(withDestinationName: "武汉市雄楚大道", destinationCoordinate: CLLocationCoordinate2DMake(39.99517568, 114.41148289), originCoordinate: lociton?.coordinate ?? CLLocationCoordinate2DMake(0, 0))
            
        case 14:
            zyf_pushVC(vc: RxViewController.init(), animated: true)
        case 15:
            zyf_pushVC(vc: TextFieldViewController.init(), animated: true)
        default:
            let vc = TextViewController.init()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            break
        }
    }
    //保存图片到相册
    func saveImageToPhotoAlbum(img: UIImage) {
        //相册权限
        let albumStatus = PHPhotoLibrary.authorizationStatus()
        if albumStatus == .notDetermined {
          // 第一次触发授权 alert
            PHPhotoLibrary.requestAuthorization { (status: PHAuthorizationStatus) in
                DispatchQueue.main.async {
                    if status == .authorized {
                        UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil)
                        ZYFHUD.show(withMessage: "保存成功")
                    }else {
                        ZYFHUD.show(withMessage: "保存失败")
                    }
                }
            }
        } else if albumStatus == .authorized {
            UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil)
            ZYFHUD.show(withMessage: "保存成功")
        } else {
            ZYFHUD.show(withMessage: "保存失败")
        }
    }
}
