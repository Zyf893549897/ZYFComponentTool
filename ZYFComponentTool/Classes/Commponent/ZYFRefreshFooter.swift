//
//  ZYFRefreshFooter.swift
//  Common
//
//  Created by issuser on 2022/3/16.
//

import UIKit

class ZYFRefreshFooter: MJRefreshAutoNormalFooter {
    override var state: MJRefreshState {
        didSet {
            switch state {
            case .idle:
                self.stateLabel?.isHidden = true
                self.stateLabel?.text = ""
            case .noMoreData:
                self.stateLabel?.isHidden = false
                self.stateLabel?.text = "没有更多数据了"
                self.stateLabel?.font = UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 10)
            case .refreshing:
                self.stateLabel?.isHidden = true
                self.stateLabel?.text = ""
            default:
                self.stateLabel?.isHidden = true
                self.stateLabel?.text = ""
            }
        
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let centerX = bounds.size.width * 0.5
        let centerY = bounds.size.height * 0.5
        loadingView?.center = CGPoint(x: centerX, y: centerY)
    }
}
