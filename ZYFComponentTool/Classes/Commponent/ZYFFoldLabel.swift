//
//  ZYFFoldLabel.swift
//  ZYFTool
//
//  Created by 张云飞 on 2022/1/6.
//

import UIKit
public enum TapStyle {
    case all   //点击全部区域有效
    case foot  //点击尾部文字有效
}
public class ZYFFoldLabel: UILabel {
    public var myfont: UIFont = UIFont.systemFont(ofSize: 14.0)
    public var textcolor: UIColor = UIColor.black
    public var footColor: UIColor = UIColor.red //尾部字体颜色
    public var tapType: TapStyle = .foot //默认点击尾部文字有效
    public var maxLines: Int{
        didSet{
            numberOfLines=maxLines
        }
    }
    public var tsqAttributedText:NSMutableAttributedString?
    public var showAll = false
    public var closure:((Bool)->Void)?
    public init(maxLines:Int = 0) {
        self.maxLines = maxLines
        super.init(frame: .zero)
        numberOfLines = maxLines
        lineBreakMode = .byClipping
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
 
    public override func draw(_ rect: CGRect) {
        if let attTxt = tsqAttributedText {
            let ctLines = attTxt.ctLines(rect:CGRect(x: 0, y: 0, width: rect.width, height: CGFloat.greatestFiniteMagnitude))
            if ctLines.count > maxLines {
                //除了AutoLayout，AutoresizingMask也是一种布局方式，translatesAutoresizingMaskIntoConstraints ＝ true , 此时视图的AutoresizingMask会被转换成对应效果的约束。这样很可能就会和我们手动添加的其它约束有冲突。此属性设置成false时，AutoresizingMask就不会变成约束。也就是说 当前 视图的 AutoresizingMask失效了。
                translatesAutoresizingMaskIntoConstraints=false
                var rangeSample = NSRange(location: attTxt.length - 1, length: 1)
                let attrKeys:[NSAttributedString.Key : Any] = attTxt.attributes(at: 0, effectiveRange: &rangeSample)
                var optAttrKeys = attrKeys
                optAttrKeys[NSAttributedString.Key.foregroundColor] = footColor
                var optAttText:NSMutableAttributedString!
                if showAll {
                    optAttText = NSMutableAttributedString(string: " 收起", attributes: optAttrKeys)
                } else {
                    optAttText = NSMutableAttributedString(string: "... 展开 ", attributes: attrKeys)
                    optAttText.setAttributes(optAttrKeys, range: NSRange(location: 4, length: 2))
                }
                
                let lineBounds = CTLineGetBoundsWithOptions(ctLines[maxLines-1], [])
                let length = ctLines.prefix(maxLines).reduce(0, { $0 + CTLineGetStringRange($1).length })
                
                //附加文字的宽度   文字的 宽度
                let optWidth = optAttText.boundingRect(with: CGSize(width: rect.width, height: lineBounds.height), options: [.usesLineFragmentOrigin], context: nil).width+5
                
                let maxLen = showAll ? attTxt.length : min(CTLineGetStringIndexForPosition(ctLines[maxLines-1], CGPoint(x: rect.width - optWidth, y: 0)), length)
                
                let vAttText = NSMutableAttributedString(attributedString: attTxt.attributedSubstring(from: NSRange(location: 0, length: maxLen)))
                
                //因为如果尾部刚好遇到 \n 或者空格时  会导致  尾部的  展开 收起 显示不出来，这里  去除 最后一段文字中的 空格和换行
                vAttText.mutableString.replaceOccurrences(of: "\n", with: "", options: NSString.CompareOptions(rawValue: 0), range: NSRange(location: (vAttText.length) - 20, length: 20))
                vAttText.mutableString.replaceOccurrences(of: " ", with: "", options: NSString.CompareOptions(rawValue: 0), range: NSRange(location: (vAttText.length) - 20, length: 20))
                
                vAttText.append(optAttText)
                attributedText = vAttText
                
                if tapType == .all {
                    isUserInteractionEnabled = true
                    addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(on_trunc_toggle)))
                }else{
                    self.yb_addAttributeTapAction(with: ["... 展开","收起"]) {[weak self] (lab, str, range, indx) in
                        self?.showAll.toggle();
                        self?.closure?(self?.showAll ?? false)
                    }
                }
            }
        }
        super.draw(rect)
    }
 
    @objc private func on_trunc_toggle() { showAll.toggle();closure?(showAll) }
    /*
     attr  需要显示的类容   
     open  默认是展开还是收起
     */
    public func setAttrText(attr:String,showAll:Bool,isAttstr: Bool,closure:@escaping (Bool)->Void) {
        numberOfLines = showAll ? 0 : maxLines
        var str=NSMutableAttributedString.init()
        if isAttstr == false {//展示  普通 string
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 5
            str = NSMutableAttributedString(string: attr, attributes: [
                NSAttributedString.Key.font: myfont,
                                            NSAttributedString.Key.paragraphStyle:paragraphStyle
            ])
        }else{// 展示  html 字符串
            str = ZYFTools.string(toAttributedstr: attr, andfont: myfont, andtextColor: textColor, lineSpace: 0)
            let string = str.string
            str = ZYFTools.string(toAttributedstr: string, andfont: myfont, andtextColor: textColor, lineSpace: 0)
        }
        
        self.tsqAttributedText = str
        attributedText = str
        self.closure = closure
        self.showAll = showAll
        setNeedsDisplay()
    }
}
extension NSAttributedString {
    func ctLines(rect:CGRect) -> [CTLine] {
        let frameSet = CTFramesetterCreateWithAttributedString(self)
        let path = CGMutablePath()
        path.addRect(rect)
        let frame = CTFramesetterCreateFrame(frameSet, CFRangeMake(0, 0), path, nil)
        return CTFrameGetLines(frame) as? [CTLine] ?? [CTLine]()
    }
    func height(width:CGFloat) -> CGFloat {
        boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin], context: nil).height
    }
}
