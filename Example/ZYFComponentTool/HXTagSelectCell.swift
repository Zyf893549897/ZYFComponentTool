//
//  HXTagSelectCell.swift
//  ZYFComponentTool_Example
//
//  Created by 张云飞 on 2023/7/12.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import TTGTags

class HXTagModel: BaseModel {
    var name: String = ""
    var idstr: String = ""
    var isSelect: Bool = false
}

class HXTagSelectCell: BaseTableViewCell {
    var dataArr = [HXTagModel]()
    var tagsArr = ["听音乐","看电影","打游戏","旅游","运动","瑜伽","旅游","运动","瑜伽","旅游","主播离麦时间过长"]
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        for index in 0 ..< tagsArr.count {
            let mod = HXTagModel.init()
            mod.idstr = "\(index)"
            mod.name = tagsArr[index]
            dataArr.append(mod)
        }
        
        backgroundColor = .white
        contentView.backgroundColor = .red
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(tagView)
        setViewLayout()
    }
    lazy var titleLabel: UILabel = {
        let label = ZYFCreatLable(frame: CGRect.zero,
                                  text: "类型",
                                  textcolor: .black,
                                  Alignment: .left,
                                  font: UIFont.setFontStlye(style: .PingFang_SC_Medium, scaleFontSize: 14),
                                  bgcolor: .clear,
                                  num: 1)
        return label
    }()
    lazy var tagView: TTGTextTagCollectionView = {
        let statusView = TTGTextTagCollectionView()
        statusView.manualCalculateHeight = true
        statusView.horizontalSpacing = zScale(8)
        statusView.verticalSpacing = zScale(12)
        statusView.delegate = self
        return statusView
    }()
    func setViewsMes() {
        titleLabel.textColor = .black
        // 标签
        for model in dataArr {
            let content = TTGTextTagStringContent.init(text: model.name)
            content.textColor = .black
            content.textFont = UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 12)
            
            let selectContent = TTGTextTagStringContent.init(text: model.name)
            selectContent.textColor = .red
            selectContent.textFont = UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 12)
            
            let normalStyle = TTGTextTagStyle.init()
            normalStyle.backgroundColor = .white
            normalStyle.exactHeight = zScale(24)
            normalStyle.borderColor = .white
            normalStyle.cornerRadius = zScale(12)
            normalStyle.extraSpace = CGSize.init(width: 15, height: 15)// 这里的值 回影响高度的 自动计算 需要指定preferredMaxLayoutWidth 属性 高度才准确
            normalStyle.shadowOffset = CGSize.zero
            normalStyle.shadowColor = .clear
            
            let selecNormalStyle = TTGTextTagStyle.init()
            selecNormalStyle.backgroundColor = .orange
            selecNormalStyle.exactHeight = zScale(24)
            selecNormalStyle.borderColor = .orange
            selecNormalStyle.cornerRadius = zScale(12)
            selecNormalStyle.extraSpace = CGSize.init(width: 15, height: 15)
            selecNormalStyle.shadowOffset = CGSize.zero
            selecNormalStyle.shadowColor = .clear
            
            let tag = TTGTextTag.init()
            tag.content = content
            tag.selectedContent = selectContent
            tag.style = normalStyle
            tag.selectedStyle = selecNormalStyle
            tag.selected = model.isSelect
            
            tagView.addTag(tag)
        }
        // 重新计算TTGTextTagCollectionView的高度
        tagView.preferredMaxLayoutWidth = ZYFScreenWidth - zScale(30)
        tagView.invalidateIntrinsicContentSize()
        tagView.layoutIfNeeded()
        
        tagView.reload()
    }
    func setViewLayout() {
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(zScale(15))
            make.top.equalTo(zScale(10))
        }
        tagView.snp.makeConstraints { make in
            make.left.equalTo(zScale(15))
            make.top.equalTo(titleLabel.snp.bottom).offset(zScale(5))
            make.right.equalTo(-zScale(15))
            make.bottom.equalTo(-zScale(10))
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
extension HXTagSelectCell: TTGTextTagCollectionViewDelegate {
    func textTagCollectionView(_ textTagCollectionView: TTGTextTagCollectionView!, canTap tag: TTGTextTag!, at index: UInt) -> Bool {
        let mod = dataArr[safeGet: Int(index)]
        if mod?.isSelect == true {
            mod?.isSelect = false
            tagView.reload()
            return true
        } else {
            var selectNum = 0
            for _ in (dataArr.filter {$0.isSelect == true}) {
                selectNum += 1
            }
            if selectNum >= 3 {
                ZYFHUD.show(withMessage: "最多选择3个")
                return false
            }
            mod?.isSelect = true
            tagView.reload()
            return true
        }
    }
}
