//
//  PopupContainerView.swift
//  PopupWindow
//
//  Created by Shinji Hayashi on 2017/12/22.
//  Copyright © 2017年 shin884. All rights reserved.
//

import UIKit

public class PopupContainerView: UIView {
    var isAbleToTouchLower: Bool = false

    override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let view = super.hitTest(point, with: event) {
            if isAbleToTouchLower && view == self { return nil }
            return view
        }
        return nil
    }
}
