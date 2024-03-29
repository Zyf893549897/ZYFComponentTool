//
//  SelectImageView.swift
//  QJBSH
//
//  Created by 张云飞 on 2022/10/22.
//

import UIKit

class SelectImageView: UIView {
    @objc var selecImageblock: ReturnImageArrBlock? // 选中图片后返回数组
    
    @objc var maxImage = 3 //允许最大数量  默认 3
    
    @objc var index: IndexPath?
    
    @objc var cellWidth = zScale(90)
    @objc var cellhight = zScale(90)
    
    @objc var picArr: Array<Any>?{
        didSet{
            setViewsMessage()
        }
    }
    @objc var heigtBlock: ReturnFloatBlock?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        
        setViewsLayout()
    }
    lazy  var collectionView: UICollectionView = {
        let layuot = UICollectionViewFlowLayout.init()
        layuot.minimumLineSpacing = 10
        layuot.minimumInteritemSpacing = 8;//cell列之间的间隙，最小的
        layuot.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        let collecView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layuot)
        collecView.backgroundColor=UIColor.white
        collecView.showsVerticalScrollIndicator=false
        collecView.showsHorizontalScrollIndicator=false
        collecView.delegate=self
        collecView.dataSource=self
        collecView.register(ImageCollectionCell.self)
        collecView.isScrollEnabled = false
        return collecView
    }()
   func setViewsMessage(){
        collectionView.reloadData()
        collectionView.snp.remakeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(collectionView.collectionViewLayout.collectionViewContentSize.height<cellhight ? cellhight:collectionView.collectionViewLayout.collectionViewContentSize.height)
        }
        if selecImageblock != nil{
            selecImageblock?(picArr ?? [])
        }
    }
    func setViewsLayout(){
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(cellhight)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension SelectImageView: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellhight)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picArr?.count == maxImage ? picArr?.count ?? 0 : (picArr?.count ?? 0) + 1
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(ImageCollectionCell.self, indexPath: indexPath)
        cell.maxSelectNum = maxImage //可选最大数量
        if indexPath.row < picArr?.count ?? 0{// 显示图片 排查最后一个添加符号
            if picArr?.first is UIImage{
                cell.imgeView.image = picArr?[indexPath.row] as? UIImage
            }
            if picArr?.first is String{
                cell.imgeView.zyf_setImage(urlstr: "img_url" + "\(picArr?[indexPath.row] ?? "")", placehoder: "")
            }
        }
        if indexPath.row == picArr?.count{//是否为最后一个 添加按键
            cell.setViewsMessage(type: .add_image, row: indexPath.row,haveNum: picArr?.count ?? 0)
        }else{
            cell.setViewsMessage(type: .show_dele_image, row: indexPath.row,haveNum: picArr?.count ?? 0)
        }
        //选择图片回调
        cell.block = {[weak self] imgArr in
            self?.picArr?.append(contentsOf: imgArr)
            self?.setViewsMessage()// 显示图片
        }
        //删除图片回调
        cell.deleBlock = {[weak self] indx in
            self?.picArr?.remove(at: indx)
            self?.setViewsMessage()// 显示图片
        }
        return cell
    }
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //点击放大
//        var arr = [GKPhoto]()
//        for urlstr in picArr ?? []{
//            let photo = GKPhoto.init()
//            if let url = URL(string: "\(img_url)\(urlstr)"){
//                photo.url = url
//                arr.append(photo)
//            }
//        }
//        let browser = GKPhotoBrowser.init(photos: arr, currentIndex: indexPath.row)
//        browser.showStyle = .none
//        browser.show(fromVC: zyf_curreVC())
    }
}
