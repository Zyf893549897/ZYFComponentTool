//
//  Font+Extension.swift
//  Assemble
//
//  Created by xiongchuanqi on 2022/1/8.
//

import Foundation
import UIKit
public enum FontStly{
    case PingFang_SC_Regular
    case PingFang_SC_Medium
    case PingFang_SC_Light
    case PingFang_SC_Semibold
    
    case Peugeot_New  //PeugeotNew-Black
    case PeugeotNew_Black // PeugeotNew-Black
    case PeugeotNew_BlackItalic
    case PeugeotNew_BoldItalic
    case PeugeotNew_Bold
    case PeugeotNew_LightItalic
    case PeugeotNew_Light
    case PeugeotNew_ExtraLightItalic
    case PeugeotNew_ExtraLight
    case PeugeotNew_Italic
    case PeugeotNew_Regular
    case FZLTHJW_GB1_0
    case FZLTXHJW_GB1_0
    case FZLTZHJW_GB1_0
    case FZLTDHJW_GB1_0
    case other
}
extension UIFont {
    // 字体
    public class func setFontStlye(style: FontStly,scaleFontSize: CGFloat) -> UIFont{
        switch style {
        case .PingFang_SC_Regular:
            return UIFont.init(name: "PingFang-SC-Regular", size: scale(scaleFontSize)) ?? UIFont.systemFont(ofSize: scale(scaleFontSize))
        case .PingFang_SC_Medium:
            return UIFont.init(name: "PingFang-SC-Medium", size: scale(scaleFontSize)) ?? UIFont.systemFont(ofSize: scale(scaleFontSize))
        case .PingFang_SC_Light:
            return UIFont.init(name: "PingFang-SC-Light", size: scale(scaleFontSize)) ?? UIFont.systemFont(ofSize: scale(scaleFontSize))
        case .PingFang_SC_Semibold:
            return UIFont.init(name: "PingFang-SC-Semibold", size: scale(scaleFontSize)) ?? UIFont.systemFont(ofSize: scale(scaleFontSize))
        case .Peugeot_New:
            return UIFont.init(name: "Peugeot New", size: scale(scaleFontSize)) ?? UIFont.systemFont(ofSize: scale(scaleFontSize))
        case .PeugeotNew_Black:
            return UIFont.init(name: "PeugeotNew-Black", size: scale(scaleFontSize)) ?? UIFont.systemFont(ofSize: scale(scaleFontSize))
        case .PeugeotNew_BlackItalic:
            return UIFont.init(name: "PeugeotNew-BlackItalic", size: scale(scaleFontSize)) ?? UIFont.systemFont(ofSize: scale(scaleFontSize))
        case .PeugeotNew_BoldItalic:
            return UIFont.init(name: "PeugeotNew-BoldItalic", size: scale(scaleFontSize)) ?? UIFont.systemFont(ofSize: scale(scaleFontSize))
        case .PeugeotNew_Bold:
            return UIFont.init(name: "PeugeotNew-Bold", size: scale(scaleFontSize)) ?? UIFont.systemFont(ofSize: scale(scaleFontSize))
        case .PeugeotNew_LightItalic:
            return UIFont.init(name: "PeugeotNew-LightItalic", size: scale(scaleFontSize)) ?? UIFont.systemFont(ofSize: scale(scaleFontSize))
        case .PeugeotNew_Light:
            return UIFont.init(name: "PeugeotNew-Light", size: scale(scaleFontSize)) ?? UIFont.systemFont(ofSize: scale(scaleFontSize))
        case .PeugeotNew_ExtraLightItalic:
            return UIFont.init(name: "PeugeotNew-ExtraLightItalic", size: scale(scaleFontSize)) ?? UIFont.systemFont(ofSize: scale(scaleFontSize))
        case .PeugeotNew_ExtraLight:
            return UIFont.init(name: "PeugeotNew-ExtraLight", size: scale(scaleFontSize)) ?? UIFont.systemFont(ofSize: scale(scaleFontSize))
        case .PeugeotNew_Italic:
            return UIFont.init(name: "PeugeotNew-Italic", size: scale(scaleFontSize)) ?? UIFont.systemFont(ofSize: scale(scaleFontSize))
        case .PeugeotNew_Regular:
            return UIFont.init(name: "PeugeotNew-Regular", size: scale(scaleFontSize)) ?? UIFont.systemFont(ofSize: scale(scaleFontSize))
        case .FZLTHJW_GB1_0:
            return UIFont.init(name: "FZLTHJW--GB1-0", size: scale(scaleFontSize)) ?? UIFont.systemFont(ofSize: scale(scaleFontSize))
        case .FZLTXHJW_GB1_0:
            return UIFont.init(name: "FZLTXHJW--GB1-0", size: scale(scaleFontSize)) ?? UIFont.systemFont(ofSize: scale(scaleFontSize))
        case .FZLTZHJW_GB1_0:
            return UIFont.init(name: "FZLTZHJW--GB1-0", size: scale(scaleFontSize)) ?? UIFont.systemFont(ofSize: scale(scaleFontSize))
        case .FZLTDHJW_GB1_0:
            return UIFont.init(name: "FZLTDHJW--GB1-0", size: scale(scaleFontSize)) ?? UIFont.systemFont(ofSize: scale(scaleFontSize))
        default:
            return UIFont.systemFont(ofSize: scale(scaleFontSize))
        }
    }
}
