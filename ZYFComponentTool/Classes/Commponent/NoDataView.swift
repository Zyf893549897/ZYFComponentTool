//
//  NoDataView.swift
//  ZYFTool
//
//  Created by 张云飞 on 2021/12/31.
//

import UIKit

//自定义无数据页面
@objc public enum NodataStyle: Int{
    case nodata   //无数据
    case nonetwork // 无网
    case other // 其他
}
public class NoDataView: UIView {
    // 自己想要什么样式 就 写什么样式
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(nodataImageView)
    }
    @objc public lazy var nodataImageView: UIImageView = {
        let imgView=ZYFCreatImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), imgName: "", bgcolor: .red, radius: 10)
        imgView.center=self.center
        return imgView
    }()
    // 写一个方法 修改无数据页面的 样式 供外部调用  例如 无网络  无数据 或者其他异常等
    @objc public func noDataStyle(type: NodataStyle) {
        switch type {
        case .nodata:
            nodataImageView.backgroundColor = .red
        case .nonetwork:
            nodataImageView.backgroundColor = .blue
        default:
            nodataImageView.backgroundColor = .blue
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
