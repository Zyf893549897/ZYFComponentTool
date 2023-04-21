//
//  Collection+Extension.swift
//  ZYFTools
//
//  Created by 张云飞 on 2022/10/13.
//

import UIKit

protocol CollectionReusable
{
    static var reuseIdentifier: String { get }
}

extension CollectionReusable
{
    static var reuseIdentifier: String
    {
        return String(describing: self)
    }
}

extension UIViewController: CollectionReusable {

}

extension UICollectionReusableView: CollectionReusable {

}

public extension UICollectionView{
    func register<Cell: UICollectionViewCell>(_ cellType: Cell.Type)
    {
        register(cellType, forCellWithReuseIdentifier: Cell.reuseIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(_ cell: T.Type ,indexPath: IndexPath) -> T
    {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else
        {
            return T.init()
        }
        return cell
    }


    func dequeueReusableView<T: UICollectionReusableView>(_ reusableView: T.Type ,indexPath: IndexPath,kind:String) -> T
    {
        guard let cell = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else
        {
            return T.init(frame: .zero)
        }

        return cell
    }
}
