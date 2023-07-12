//
//  UIScrollView+ZYFExtension.swift
//  HXVoiceChat
//
//  Created by 张云飞 on 2023/5/29.
//  Copyright © 2023 com.haixue. All rights reserved.
//

import Foundation
import UIKit
import LYEmptyView
import MJRefresh
@objc public protocol RefreshNodataDelegate: AnyObject {
    @objc optional func uploadNewDataAction()
    @objc optional func downloadMoreDataAction()
    @objc optional func nodataViewbutAction()
}

public extension UIScrollView {
    private struct CustomProperties {
        static var refrashDelegate: RefreshNodataDelegate?
        static var pageNoKey: Int = 0
        static var emptyViewKey: LYEmptyView?
        static var noDataViewKey: NoDataView?
    }
    
    var refrashDelegate: RefreshNodataDelegate? {
        get {
            return objc_getAssociatedObject(self, &CustomProperties.refrashDelegate) as? RefreshNodataDelegate
        }
        set {
            objc_setAssociatedObject(self, &CustomProperties.refrashDelegate, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    var page_no: Int {
        get {
            return objc_getAssociatedObject(self, &CustomProperties.pageNoKey) as? Int ?? 0
        }
        set {
            objc_setAssociatedObject(self, &CustomProperties.pageNoKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var emptyView: LYEmptyView? {
        get {
            return objc_getAssociatedObject(self, &CustomProperties.emptyViewKey) as? LYEmptyView
        }
        set {
            objc_setAssociatedObject(self, &CustomProperties.emptyViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    var noDataView: NoDataView? {
        get {
            return objc_getAssociatedObject(self, &CustomProperties.noDataViewKey) as? NoDataView
        }
        set {
            objc_setAssociatedObject(self, &CustomProperties.noDataViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    
    func addUpAndDownRefresh() {
        //添加刷新逻辑
        page_no = 1;//初始值为1
        
        let gitHeader = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(downloadMoreData))
        mj_header = gitHeader;
        /*
         上拉加载更多
         */   //MJRefreshAutoFooter
        let footer = ZYFRefreshFooter.init(refreshingTarget: self, refreshingAction: #selector(uploadNewData))
        mj_footer = footer;
        mj_footer?.mj_h = zScale(20)
        
        noDataView = NoDataView.init(frame: CGRectMake(0, 0, ZYFScreenWidth, zScale(190)))
        emptyView = LYEmptyView.emptyView(withCustomView: noDataView)
        emptyView?.autoShowEmptyView = true;
        ly_emptyView = emptyView!;
    }
    
    @objc func downloadMoreData() {
        //下拉刷新逻辑
        page_no = 1;
        //重置为普通状态
        self.mj_footer?.state = .idle
        //超过 15秒  自动结束刷新
        timeDelay(15.0) {[weak self] in
            self?.mj_header?.endRefreshing()
        }
        
        refrashDelegate?.downloadMoreDataAction?()
    }
    
    @objc func uploadNewData() {
        //上拉刷新逻辑
        page_no += 1
        refrashDelegate?.uploadNewDataAction?()
    }
    
    func endRefresh() {
        //结束刷新逻辑
        self.mj_header?.endRefreshing()
        self.mj_footer?.state = .idle
    }
    
    func noMoreDate() {
        //没有更多数据的逻辑
        self.mj_footer?.state = .noMoreData
    }
    
}
