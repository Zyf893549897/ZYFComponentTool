//
//  BannerTableViewCell.swift
//  ZYFComponentTool_Example
//
//  Created by 张云飞 on 2023/2/10.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import FSPagerView
class BannerTableViewCell: UITableViewCell {
    // 测试 banner 在cell 上纵向滚动时的 联动问题
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none;
        
        
        setViewLayout()
    }
    // 懒加载滚动图片浏览器
    lazy var pagerViewA : FSPagerView = {
        let pagerView = FSPagerView.init(frame: CGRect(x: 0, y: 0, width: ZYFScreenWidth, height: 300))
        pagerView.delegate = self
        pagerView.dataSource = self
        pagerView.scrollDirection = .vertical //滚动方向
        pagerView.automaticSlidingInterval =  0 //间隔时间  为0时 不自动滚动
        pagerView.isInfinite = true //是否无效循环
//        pagerView.itemSize = CGSize(width: 200, height: 250)
        pagerView.interitemSpacing = 10 //图片之间 间隙
//        pagerView.transformer = FSPagerViewTransformer.init(type: .zoomOut) //动画样式
        pagerView.register(BannerCell.self, forCellWithReuseIdentifier: "ShopBannerCell")
        return pagerView
    }()
    func setViewLayout(){
        contentView.addSubview(pagerViewA)
        
        pagerViewA.snp.makeConstraints { make in
            make.edges.equalTo(0)
            make.height.equalTo(300)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension BannerTableViewCell: FSPagerViewDelegate, FSPagerViewDataSource {
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 3
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "ShopBannerCell", at: index) as? BannerCell
        cell?.imgView.image = UIImage(named: "\(index+1)")
        return cell!
    }
    
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {

    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }

}
