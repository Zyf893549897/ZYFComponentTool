//
//  WaterfallCollectionViewController.swift
//  ZYFComponentTool_Example
//
//  Created by 幸荟 on 2023/2/14.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
//UICollectionViewDelegateFlowLayout
//ZLCollectionViewBaseFlowLayoutDelegate
class WaterfallCollectionViewController: ZYFBaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,ZLCollectionViewBaseFlowLayoutDelegate {
    var hiestArr = ["历史","电视机","小米手机","macBook","电视北京站","阿克苏对接焊缝卡","哈哈","aaa","好卡收到会计法","历史"]
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(gk_navigationBar.snp.bottom).offset(10)
            make.right.left.bottom.equalTo(0)
        }
    }
    lazy  var collectionView: UICollectionView = {
        let layuot = ZLCollectionViewVerticalLayout.init()//ZLCollectionViewVerticalLayout  UICollectionViewFlowLayout
        layuot.delegate=self
//        layuot.canDrag = true
//        layuot.isFloor = false
//        layuot.header_suspension = true
//        layuot.registerDecorationView([""])
        let collecView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layuot)
        collecView.backgroundColor=UIColor.orange
        collecView.showsVerticalScrollIndicator=false
        collecView.showsHorizontalScrollIndicator=false
        collecView.delegate=self
        collecView.dataSource=self
        collecView.register(CollecCell.self)
        return collecView
    }()

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hiestArr.count
    }
    //行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    //列 间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ZYFTools.getWidthWithText(hiestArr[safeGet: indexPath.row] ?? "", height: scale(28), font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 12)) + 20, height: scale(28))
    }
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: ZLCollectionViewBaseFlowLayout, typeOfLayout section: Int) -> ZLLayoutType {
        return LabelLayout
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(CollecCell.self, indexPath: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
    }

}
