//
//  ImageCollectionCell.swift
//  QJBSH
//
//  Created by 幸荟 on 2022/10/22.
//

import UIKit

typealias ReturnImageArrBlock = (Array<String>) -> Void

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
        let but = ZYFCreateImageButton(frame: CGRect.zero, bgcolor: .clear, Alignment: .center, imgName: "dele_img", isbg: false, offset: 0, target: self, action: #selector(deleButAction))
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
            imgeView.zyf_setImage(urlstr: "", placehoder: "addimg2")
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
    @objc func deleButAction(){
        if seleImageCellType == .show_dele_image{
            if deleBlock != nil{
                deleBlock?(indx ?? 0)
            }
        }
    }
    //选择图片
    func selectPictue(){
//        zyf_curreVC().view.endEditing(true)
//
//        let vc = TZImagePickerController.init(maxImagesCount: maxSelectNum - havSelecNum, delegate: nil)
//        vc?.allowPickingVideo = false
//        vc?.allowTakeVideo = false
//        vc?.allowPickingVideo = false
//        vc?.allowPickingOriginalPhoto = false
//        vc?.sortAscendingByModificationDate = false
//        vc?.naviBgColor = color_333333
//        vc?.naviTitleColor = color_333333
//        vc?.didFinishPickingPhotosHandle={[weak self] photosArray,assets,isSelectOriginalPhoto in
//            var imgdataArr = [UIImage]()
//            for img in (photosArray ?? []){
//                let imgdata = img.jpegData(compressionQuality: 0.4)
//                let img = UIImage(data: imgdata ?? Data())
//                imgdataArr.append(img ?? UIImage())
//            }
//            //上传 图片
//            self?.upImgAction(imgArr: imgdataArr)
//        }
//        zyf_curreVC().present(vc!, animated: true, completion: nil)
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
