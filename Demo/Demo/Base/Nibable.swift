//
//  Nibable.swift
//  WindowPopup
//
//  Created by Shinji Hayashi on 2017/12/19.
//  Copyright © 2017年 shinji hayashi. All rights reserved.
//

import UIKit

protocol Nibable: NSObjectProtocol {
    static var nibName: String { get }
    static func nib() -> UINib
}

extension Nibable where Self: UIView {
    static var nibName: String {
        return className
    }

    static func nib() -> UINib {
        return UINib(nibName: nibName, bundle: nil)
    }

    static func view() -> Self {
        return nib().instantiate(withOwner: nil, options: nil).first as! Self
    }
}

extension NSObjectProtocol {
    static var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
}
