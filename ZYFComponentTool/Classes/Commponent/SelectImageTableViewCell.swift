////
////  SelectImageTableViewCell.swift
////  QJB-Merchant
////
////  Created by 幸荟 on 2022/12/5.
////
//
//import UIKit
//
//class SelectImageTableViewCell: UITableViewCell {
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.selectionStyle = .none;
//
//        setViewLayout()
//    }
//    @objc lazy var titleLabel: UILabel={
//        let label = ZYFCreatLable(frame: CGRect.zero, text: "啊哈哈哈哈哈哈哈哈", textcolor: HexColorstr(hexstr: "#333333"), Alignment: .left, font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 14), bgcolor: .clear, num: 1)
//        return label
//    }()
//    
//    @objc lazy var seleImageView: SelectPictureView={
//        let view = SelectPictureView.init(frame: CGRect.zero)
//        return view
//    }()
//    
//    lazy var textView: ZYFTextView={
//        let tv = ZYFTextView.init(frame: CGRect.zero)
//        tv.font = UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 14)
//        tv.placeholder = "请输入"
//        tv.setLayer(3, 1, .red)
//        tv.maxLength = 50;
//        tv.textColor = HexColorstr(hexstr: "#333333")
//        tv.showFootNumber = true
//        tv.addTextLengthDidMaxHandler { (textView) in
//            ZYFHUD.show(withMessage: "最多输入20个字")
//        }
//        return tv
//    }()
//
//    func setViewLayout(){
//        contentView.addSubview(titleLabel)
//        contentView.addSubview(seleImageView)
//        contentView.addSubview(textView)
//        
//        
//        
//        titleLabel.snp.makeConstraints { make in
//            make.left.equalTo(16)
//            make.top.equalTo(10)
//            make.height.equalTo(30)
//        }
//        seleImageView.snp.makeConstraints { make in
//            make.top.equalTo(titleLabel.snp.bottom)
//            make.left.equalTo(16)
//            make.right.equalTo(-16)
//        }
//        textView.snp.makeConstraints { make in
//            make.left.equalTo(16)
//            make.right.equalTo(-16)
//            make.top.equalTo(seleImageView.snp.bottom)
//            make.height.equalTo(scale(100))
//            make.bottom.equalTo(-10)
//        }
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//}
