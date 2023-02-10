//
//  ZYFBaseViewController.swift
//  Common
//
//  Created by issuser on 2022/3/2.
//

import UIKit
import MJRefresh
import LYEmptyView
import GKNavigationBar
open class ZYFBaseViewController: UIViewController{
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    public var baseTableView: UITableView?
    public var page_no: Int=1   //分页参数初始值
    
    //无数据的时候，是否展示空页面，默认展示
    public var showEmpty: Bool = true
    
    private var noDataStyle: NodataStyle!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.white
        
        
        //显示自定义的 navbar 需要在控制器中  使用   gk_  属性，否则显示系统导航栏
//        gk_maxPopDistance = 40 //默认全屏 0
        gk_navTitle = ""
        
        if #available(iOS 15.0, *) {
            baseTableView?.sectionHeaderTopPadding = 0   //.plain 属性时  起点自动向下偏移问题
        }
        
        
    }
    
    //点击空白处结束编辑
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    //添加上下拉刷新
    public func addUpAndDownRefresh(){
        if baseTableView?.tableHeaderView != nil && !showEmpty{
            noDataView.isHidden = true
        }else{
            noDataView.isHidden = false
        }
        emptyView.autoShowEmptyView = false
        baseTableView?.ly_startLoading()
        //ZYFRefreshGiHeader   MJRefreshNormalHeader
        let header = MJRefreshGifHeader.init(refreshingTarget: self, refreshingAction: #selector(downloadMoreData))
        baseTableView?.mj_header = header
        
        let foot = ZYFRefreshFooter.init(refreshingTarget: self, refreshingAction: #selector(uploadNewData))
        baseTableView?.mj_footer = foot
    }
    
    //下拉刷新
    @objc open func downloadMoreData(){
        page_no = 1

        //重置为普通状态
        baseTableView?.mj_footer?.state = .idle
        //网络异常时 15秒自动结束刷新
        timeDelay(15) {[weak self] in
            if self?.baseTableView?.mj_header?.state == .refreshing{
                self?.noDataView.noDataStyle(type: .nonetwork)
            }
            self?.baseTableView?.mj_header?.endRefreshing()
        }
    }
    //上拉加载更多
    @objc open func uploadNewData(){
        page_no += 1
        
    }
    //结束刷新
    public func endRefresh(){
        baseTableView?.ly_endLoading()
        baseTableView?.mj_header?.endRefreshing()
        baseTableView?.mj_footer?.height = page_no > 1 ? 40 : 0
        guard baseTableView?.mj_footer?.state != .noMoreData else{return}
        baseTableView?.mj_footer?.state = .idle
        
    }
    //没有更多数据
    public func noMoreDate(){
        baseTableView?.mj_footer?.state = .noMoreData
    }
    
    lazy var noDataView: NoDataView = {
        let dataView=NoDataView.init(frame: CGRect(x: 0, y: -300, width: ZYFScreenWidth, height: 300))
        dataView.noDataStyle(type: noDataStyle)
        return dataView
    }()
    lazy var emptyView: LYEmptyView = {
        let emptyV=LYEmptyView.emptyView(withCustomView: noDataView)
        return emptyV!
    }()
   
    //创建tablview   这不用懒加载 是因为 style 类型只能 在init方法中给定
    public func creatTableView(style: UITableView.Style, noDataStyle: NodataStyle = .nodata) -> UITableView{
        self.noDataStyle = noDataStyle
        baseTableView=UITableView.init(frame: CGRect(x: 0, y: 0, width: ZYFScreenWidth, height: ZYFScreenHeight), style: style)
        baseTableView?.backgroundColor=UIColor.clear
        baseTableView?.tableFooterView=UIView.init()
        baseTableView?.tableHeaderView=UIView.init(frame: CGRect(x: 0, y: 0, width: ZYFScreenWidth, height: CGFloat.leastNormalMagnitude))
        emptyView.autoShowEmptyView = true //默认自动管理  当添加刷新时变为手动管理 fale
        baseTableView?.ly_emptyView = emptyView
        baseTableView?.separatorStyle = .none
        if #available(iOS 15.0, *){
            baseTableView?.sectionHeaderTopPadding = 0
        }
        return baseTableView!
    }

}
