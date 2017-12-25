//
//  PopupItem.swift
//  PopupWindow
//
//  Created by Shinji Hayashi on 2017/12/22.
//  Copyright © 2017年 shin884. All rights reserved.
//

import UIKit

public struct PopupItem {
    public let view: UIView
    public let frame: CGRect
    public let type: PopupViewType
    public let direction: PopupViewDirection
    public let margin: CGFloat
    public let hasBlur: Bool

    public init(view: UIView, frame: CGRect, type: PopupViewType, direction: PopupViewDirection, margin: CGFloat, hasBlur: Bool) {
        self.view = view
        self.frame = frame
        self.type = type
        self.direction = direction
        self.margin = margin
        self.hasBlur = hasBlur
    }
}
