//
//  Array+ZYFExtension.swift
//  ZYFComponentTool
//
//  Created by 张云飞 on 2022/9/8.
//

import UIKit

public extension Array {

    /// Element 本身为可选型时，且赋值 nil 时，无法进行判断, 故 set get 分开
    /// 请合理使用
    subscript(safeGet index: Index) -> Element? {
        get {
            return indices.contains(index) ? self[index] : nil
        }
//        set {
//            assert(false, "请使用 safeSet 赋值")
//        }
    }
    
    subscript(safeSet index: Index) -> Element {
        get {
            assert(false, "请使用 safeGet 取值")
            return self[index]
        }
        set {
            if indices.contains(index) {
                self[index] = newValue
            }
        }
    }
    
    func has(index: Index) -> Bool {
        return indices.contains(index)
    }

    mutating func remove(safe index: Index) {
        guard indices.contains(index) else {
            return
        }
        
        self.remove(at: index)
    }

    mutating func insert(safe newElement: Element, at index: Index) {
        guard index <= count && index >= 0 else {
            return
        }
        self.insert(newElement, at: index)
    }
    
    
}

