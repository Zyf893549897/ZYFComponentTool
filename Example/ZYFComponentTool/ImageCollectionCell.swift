//
//  ImageCollectionCell.swift
//  QJBSH
//
//  Created by 幸荟 on 2022/10/22.
//

import UIKit
import HXPhotoPicker
typealias ReturnImageArrBlock = (Array<Any>) -> Void

enum SelectImageCellType{
    case add_image
    case show_image
    case show_dele_image
    case other
}
class ImageCollectionCell: UICollectionViewCell {
    
    var block: ReturnImageArrBlock? // 选中图片后返回数组
    var deleBlock: ReturnIndexBlock? //图片删除block
    var imgeArr = Array<UIImage>.init()
    var maxSelectNum: Int = 0 //可选图片数量
    var havSelecNum: Int = 0 //已选图片数量
    var indx: Int?
    var seleImageCellType: SelectImageCellType?
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(imgeView)
        addSubview(chaBut)
    }
    lazy var chaBut: UIButton={
        let but = ZYFCreateImageButton(frame: CGRect.zero, bgcolor: .clear, Alignment: .center, imgName: "dele", isbg: false, offset: 0, target: self, action: #selector(deleButAction))
        return but
    }()
    lazy var imgeView: UIImageView={
        let imgV = ZYFCreatImageView(frame: CGRect.zero, imgName: "", bgcolor: .clear, radius: 2)
        imgV.contentMode = .scaleAspectFill
        imgV.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        imgV.addGestureRecognizer(tap)
        return imgV
    }()
    //赋值
    func setViewsMessage(type: SelectImageCellType,row: Int = 0,haveNum: Int = 0){
        seleImageCellType = type
        indx = row
        havSelecNum = haveNum
        
        switch seleImageCellType {
        case .add_image:
            chaBut.isHidden = true
            imgeView.isUserInteractionEnabled = true
            imgeView.zyf_setImage(urlstr: "", placehoder: "addimg")
            addimgeLayout()
            break
        case .show_image:
            chaBut.isHidden = true
            imgeView.isUserInteractionEnabled = false
            showimageLayout()
            break
        case .show_dele_image:
            chaBut.isHidden = false
            imgeView.isUserInteractionEnabled = false
            showDeleimageLayout()
            break
        default:
            break
        }
    }
    //点击事件
    @objc func tapAction(){
        if seleImageCellType == .add_image{
            selectPictue()
        }
    }
    //删除图片
    @objc func deleButAction(){
        if seleImageCellType == .show_dele_image{
            if deleBlock != nil{
                deleBlock?(indx ?? 0)
            }
        }
    }
    //选择图片
    func selectPictue(){
        zyf_curreVC().view.endEditing(true)
        let manger = HXPhotoManager.init(type: .photo)
        manger?.configuration.photoMaxNum = UInt(maxSelectNum - havSelecNum)
//        manger?.configuration.singleSelected=true//千万不能写这个方法 不然下面的 方法无法获取  thumbPhoto对象   坑坑坑
        zyf_curreVC().hx_presentSelectPhotoController(with: manger) {[weak self] (all, photoArr, videoArr, original, vc, manger) in
            var imgArr = [UIImage]()
            for model in (photoArr ?? []){
                let imgdata = UIImageJPEGRepresentation(model.thumbPhoto ?? UIImage(), 0.4)
                let img = UIImage(data: imgdata ?? Data())
                imgArr.append(img ?? UIImage())
            }
            //选择图片后刷新
            if self?.block != nil{
                self?.block?(imgArr)
            }
        } cancel: { (vc, manger) in
        }
    }
    
    //上传图片
    func upImgAction(imgArr: Array<UIImage>){
//        ZYFHUD.showLoading(withMessage: "")
//        PPNetworkHelper.uploadImages(withURL: URL_Upload + URL_more_file_upload, parameters: nil, images: imgArr) { progress in
//        } success: {[weak self] response in
//            ZYFHUD.dismissHUD()
//            guard let rootdic = response as? [String:Any],let code = rootdic["code"] as? Int else {
//                return
//            }
//            if code == 200{
//                guard let rootdic = response as? [String:Any],let arr = rootdic["data"] as? [Any] else {
//                    return
//                }
//                var urlArr = [String]()
//                for dicmod in arr{//relative_url   url
//                    guard let dic = dicmod as? [String:Any],let urlstr = dic["relative_url"] as? String else{
//                        return
//                    }
//                    urlArr.append(urlstr)
//                }
//                if self?.block != nil{
//                    self?.block?(urlArr)
//                }
//            }
//        } failure: { error in
//            ZYFHUD.showEorre(error?.localizedDescription ?? "")
//        }
    }
    
    func addimgeLayout(){
        imgeView.snp.makeConstraints { make in
            make.left.top.equalTo(0)
            make.bottom.right.equalTo(0)
        }
    }
    func showimageLayout(){
        imgeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func showDeleimageLayout(){
        imgeView.snp.makeConstraints { make in
            make.left.top.equalTo(0)
            make.bottom.right.equalTo(0)
        }
        chaBut.snp.makeConstraints { make in
            make.top.right.equalTo(0)
            make.width.height.equalTo(scale(15))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
