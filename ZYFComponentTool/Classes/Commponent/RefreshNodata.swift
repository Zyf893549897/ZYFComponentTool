//
//  RefreshNodata.swift
//  ZYFComponentTool
//
//  Created by mac on 2023/4/17.
//

import Foundation
import LYEmptyView

private var page_noKey: Void?
private var emptyViewKey: Void?
private var noDataViewKey: Void?
private var delegateKey: Void?
//上下拉刷新协议
@objc public protocol RefreshNodataDelegate {
   @objc optional func uploadNewDataAction() //上啦
   @objc optional func downloadMoreDataAction() //下拉
}
public extension UIScrollView{
    //添加分页参数
    var page_no: Int{
        get {
            return objc_getAssociatedObject(self, &page_noKey) as? Int ?? 1
        }
        set {
            objc_setAssociatedObject(self, &page_noKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }

    }
    //添加无数据页面
     var emptyView: LYEmptyView?{
        get {
            return objc_getAssociatedObject(self, &emptyViewKey) as? LYEmptyView
        }
        set {
            objc_setAssociatedObject(self, &emptyViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }

    }
     var noDataView: NoDataView?{
        get {
            return objc_getAssociatedObject(self, &noDataViewKey) as? NoDataView
        }
        set {
            objc_setAssociatedObject(self, &noDataViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }

    }
    //代理
     var refrashDelegate: RefreshNodataDelegate?{
        get {
            return objc_getAssociatedObject(self, &delegateKey) as? RefreshNodataDelegate
        }
        set {
            objc_setAssociatedObject(self, &delegateKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }

    }
    
    //上下拉刷新
    @objc func addUpAndDownRefresh(){
        page_no = 1;//初始值为1
        let header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(downloadMoreData))
        self.mj_header = header
        
        let foot = MJRefreshAutoFooter.init(refreshingTarget: self, refreshingAction: #selector(uploadNewData))
        self.mj_footer = foot
        self.mj_footer?.mj_h = 0
        

        noDataView = NoDataView.init(frame: CGRect(x: 0, y: 0, width: ZYFScreenWidth, height: zScale(190)))
        self.emptyView = LYEmptyView.emptyView(withCustomView: noDataView)
        self.emptyView?.autoShowEmptyView = true
        self.ly_emptyView = emptyView
    }//添加刷新
    
    //下拉
    @objc func downloadMoreData(){
        page_no = 1

        //重置为普通状态
        self.mj_footer?.state = .idle
        //网络异常时 15秒自动结束刷新
        timeDelay(15) {[weak self] in
            if self?.mj_header?.state == .refreshing{
                self?.noDataView?.noDataStyle(type: .nonetwork)
            }
            self?.mj_header?.endRefreshing()
        }
        
        if refrashDelegate != nil{
            refrashDelegate?.downloadMoreDataAction?()
        }
    }
    
    //上拉
    @objc func uploadNewData(){
        page_no += 1
        
        if refrashDelegate != nil{
            refrashDelegate?.uploadNewDataAction?()
        }
    }
    
    //结束刷新
    @objc func endRefresh(){
        self.mj_header?.endRefreshing()
        self.mj_footer?.state = .idle
    }
    
    //没有更多数据了
    @objc func noMoreDate(){
        self.mj_footer?.state = .noMoreData;
    }
}
