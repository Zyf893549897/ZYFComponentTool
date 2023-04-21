//
//  UIImageView+Extensions.swift
//  ZYFComponentTool
//
//  Created by 张云飞 on 2023/1/31.
//

import Foundation
import SDWebImage
public extension UIImageView{
    func zyf_setImage(urlstr: String?,placehoder: String?){
        self.sd_setImage(with: URL.init(string: urlstr ?? ""), placeholderImage: UIImage.init(named: placehoder ?? ""))
    }
}
