//
//  UITableView+ZYFExtensions.swift
//  ZYFComponentTool
//
//  Created by 张云飞 on 2022/9/8.
//

import UIKit

protocol ORAReusable {
    static var reuseIdentifier: String { get }
}

extension ORAReusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
public extension UITableView {
    
    //刷新cell 的高度 不刷新cell
    func refreshTableCellHeight(){
        self.beginUpdates()
        self.endUpdates()
    }
    /// <#Description#>
    /// - Parameter cellType: <#cellType description#>
    func register<Cell: UITableViewCell>(_ cellType: Cell.Type)
    {
       register(cellType, forCellReuseIdentifier: Cell.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ cell: T.Type) -> T
    {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else
        {
            return T(style: .default, reuseIdentifier: T.reuseIdentifier)
        }
        cell.selectionStyle = .none
        return cell
    }
}
extension UITableViewCell: ORAReusable {
    
}






