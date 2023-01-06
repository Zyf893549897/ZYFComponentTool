//
//  Table+Extension.swift
//  ZYFTools
//
//  Created by 幸荟 on 2022/10/13.
//

import UIKit

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
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
extension UITableViewCell: Reusable {
    
}
