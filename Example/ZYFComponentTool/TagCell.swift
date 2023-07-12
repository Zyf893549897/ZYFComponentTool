//
//  TagCell.swift
//  QJB-iOS
//
//  Created by 张云飞 on 2023/2/13.
//

import UIKit

class TagCell: UITableViewCell, UICollectionViewDelegate,UICollectionViewDataSource,ZLCollectionViewBaseFlowLayoutDelegate {
    var showMore: Bool = false //是否展示 全部 默认展示部分 这里全部也最多 展示20 个
    var maxNum: Int = 20
    var minNum: Int = 8
    var tagArr = Array<String>.init()
    var refrashBlock: NoArgumentsBlock?
    var cellTab: UITableView?
    var cellIndex: IndexPath?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none;
        contentView.backgroundColor = .red
        
        setViewLayout()
    }
    lazy var titleLabel: UILabel={
        let label = ZYFCreatLable(frame: .zero, text: "历史记录", textcolor: HexColorstr(hexstr: "#333333"), Alignment: .left, font: UIFont.setFontStlye(style: .PingFang_SC_Medium, scaleFontSize: 16), bgcolor: .clear, num: 1)
        return label
    }()
    lazy var clearBut: UIButton={
        let but = ZYFCreateButton(frame: .zero, text: "清空", bgcolor: .clear, textcolor: HexColorstr(hexstr: "#000000"), font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 14), Alignment: .right, imgName: "删除-地址", isbg: false, imgStyle: img_Left, space: 2, offset: 0, target: self, action: #selector(deleAction))
        return but
    }()
    lazy  var collectionView: UICollectionView = {
        let layuot = ZLCollectionViewVerticalLayout.init()//ZLCollectionViewVerticalLayout
        layuot.delegate = self
//        layuot.canDrag = true
//        layuot.isFloor = false
//        layuot.header_suspension = true
//        layuot.registerDecorationView([""])
        let collecView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layuot)
        collecView.backgroundColor=UIColor.clear
        collecView.showsVerticalScrollIndicator=false
        collecView.showsHorizontalScrollIndicator=false
        collecView.delegate=self
        collecView.dataSource=self
        collecView.register(TagCollectionCell.self)
        return collecView
    }()
    
    func setViewsMessage(arr: Array<String>,table: UITableView,indx: IndexPath){
        cellTab = table
        cellIndex = indx
        tagArr = arr
        
        collectionView.reloadData()
        
        collectionView.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.bottom.equalTo(-15)
            make.height.equalTo(collectionView.collectionViewLayout.collectionViewContentSize.height)
        }

        cellTab?.refreshTableCellHeight()
    }
    
    @objc func deleAction(){
        
    }
    
    func setViewLayout(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(clearBut)
        contentView.addSubview(collectionView)
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.top.equalTo(25)
        }
        clearBut.snp.makeConstraints { make in
            make.right.equalTo(-16)
            make.width.equalTo(zScale(80))
            make.centerY.equalTo(titleLabel.snp.centerY)
        }
        collectionView.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.bottom.equalTo(-15)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if showMore == true{
            return tagArr.count > maxNum ? maxNum:tagArr.count
        }else{
            return tagArr.count > minNum ? minNum + 1 : tagArr.count
        }
        
    }
    //行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    //列 间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if showMore == true{
            return CGSize(width: ZYFTools.getWidthWithText(tagArr[safeGet: indexPath.row] ?? "", height: zScale(28), font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 12)) + 20, height: zScale(28))
        }else{
            if tagArr.count > minNum && minNum == indexPath.row{
                return CGSize(width: zScale(28), height: zScale(28))
            }else{
                return CGSize(width: ZYFTools.getWidthWithText(tagArr[safeGet: indexPath.row] ?? "", height: zScale(28), font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 12)) + 20, height: zScale(28))
            }
        }
        
    }
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: ZLCollectionViewBaseFlowLayout, typeOfLayout section: Int) -> ZLLayoutType {
        return LabelLayout
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(TagCollectionCell.self, indexPath: indexPath)
        
        if showMore == true{
            cell.tagBut.setTitle(tagArr[safeGet: indexPath.row], for: .normal)
            cell.tagBut.setImage(UIImage(named: ""), for: .normal)
            cell.tagBut.backgroundColor = .white
        }else{
            if tagArr.count > minNum && minNum == indexPath.row{
                cell.tagBut.setTitle("", for: .normal)
                cell.tagBut.setImage(UIImage(named: "xia"), for: .normal)
                cell.tagBut.backgroundColor = .clear
            }else{
                cell.tagBut.setTitle(tagArr[safeGet: indexPath.row], for: .normal)
                cell.tagBut.setImage(UIImage(named: ""), for: .normal)
                cell.tagBut.backgroundColor = .white
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if tagArr.count > minNum && minNum == indexPath.row{
            showMore = true
            setViewsMessage(arr: tagArr,table: cellTab ?? UITableView(),indx: cellIndex ?? IndexPath())
            cellTab?.reloadData()
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
