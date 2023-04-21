//
//  ZYFSearchView.swift
//  QJB-iOS
//
//  Created by 张云飞 on 2023/2/13.
//

import UIKit

protocol ZYFSearchBoxDelegate: NSObjectProtocol{
    func fetchBackString(str: String)
}
class ZYFSearchView: UIView,UITextFieldDelegate {

    var placehoderstr: String?{
        didSet{
            textfiled.placeholder = placehoderstr
        }
    }
    weak var delegate: ZYFSearchBoxDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(searchImageView)
        addSubview(textfiled)
        addSubview(chaBut)
        
        setViewsLayout()
    
    }
    lazy var searchImageView: UIImageView={
        let imgV = ZYFCreatImageView(frame: CGRect.zero, imgName: "search_img", bgcolor: .clear, radius: 0)
        return imgV
    }()
    
    lazy var textfiled: UITextField={
        let text = ZYFCreateTextfiled(frame: CGRect.zero, placeholder: "搜索", Alignment: .left, font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 14), textcolor: HexColorstr(hexstr: "#333333"), bgColor: .clear)
        text.keyboardType = UIKeyboardType.webSearch//.UIKeyboardTypeWebSearch
        text.delegate=self
        return text
    }()
    lazy var chaBut: UIButton={
        let but = ZYFCreateImageButton(frame: .zero, bgcolor: .clear, Alignment: .center, imgName: "search_cha", isbg: false, offset: 0, target: self, action: #selector(cealerButAction))
        but.isHidden = true
        return but
    }()
    //清空
    @objc func cealerButAction(but: UIButton){
        textfiled.text = ""
        delegate?.fetchBackString(str: "")
    }
    
    func setViewsLayout(){
        
        self.snp.makeConstraints { make in
            make.width.equalTo(ZYFScreenWidth-scale(70))
            make.height.equalTo(30)
        }//这段代码是因为  这个  view 本身放在nav上的 缘故    即 navTitleView = self 的缘故   如增加该布局
        
        
        searchImageView.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.width.height.equalTo(scale(15))
            make.centerY.equalTo(self.snp.centerY)
        }
        textfiled.snp.makeConstraints { make in
            make.top.bottom.equalTo(0)
            make.left.equalTo(searchImageView.snp.right).offset(5)
            make.right.equalTo(-70)
        }
        chaBut.snp.makeConstraints { make in
            make.right.equalTo(-10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(12)
        }
    }
   
    
    //MARK: ---------------UITextFieldDelegate---------------
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.fetchBackString(str: textfiled.text ?? "")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let str = textfiled.text
        if str?.count ?? 0 > 0{
            delegate?.fetchBackString(str: textfiled.text ?? "")
        }
        return true
    }
  
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let str = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
        chaBut.isHidden = str.count>0 ? false:true
        return true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
