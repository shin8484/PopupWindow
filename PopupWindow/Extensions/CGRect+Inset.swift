//
//  CGRect+Inset.swift
//  PopupWindow
//
//  Created by Shinji Hayashi on 2017/12/21.
//  Copyright © 2017年 shin884. All rights reserved.
//

import UIKit

extension CGRect {
    func addBottomInset(_ insets: UIEdgeInsets) -> CGRect {
        return CGRect(x: origin.x, y: origin.y - insets.bottom, width: width, height: height)
    }

    func addTopInset(_ insets: UIEdgeInsets) -> CGRect {
        return CGRect(x: origin.x, y: origin.y + insets.bottom, width: width, height: height)
    }
}
