//
//  SelectImageTableViewCell.swift
//  QJB-Merchant
//
//  Created by 张云飞 on 2022/12/5.
//

import UIKit

class SelectImageTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none;
        contentView.backgroundColor = .red
        setViewLayout()
    }
    @objc lazy var titleLabel: UILabel={
        let label = ZYFCreatLable(frame: CGRect.zero, text: "啊哈哈哈哈哈哈哈哈", textcolor: HexColorstr(hexstr: "#333333"), Alignment: .left, font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 14), bgcolor: .clear, num: 1)
        return label
    }()
    
    @objc lazy var seleImageView: SelectImageView={
        let view = SelectImageView.init(frame: CGRect.zero)
        return view
    }()

    func setViewLayout(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(seleImageView)
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.top.equalTo(10)
            make.height.equalTo(30)
        }
        seleImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.bottom.equalTo(-10)
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
