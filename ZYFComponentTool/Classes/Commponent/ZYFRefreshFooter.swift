//
//  ZYFRefreshFooter.swift
//  Common
//
//  Created by issuser on 2022/3/16.
//

import UIKit

class ZYFRefreshFooter: MJRefreshAutoNormalFooter {

    //如果需要自定义样式
    override var state: MJRefreshState{
        didSet{
            //各种状态显示什么文字在这里修改
            if state == .noMoreData{
                self.setTitle("--没有更多数据--", for: .noMoreData)
            }else if state == .idle{
                self.setTitle("", for: .idle)
            }
        }
    }

}
