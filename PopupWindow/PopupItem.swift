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
    public let height: CGFloat
    public let maxWidth: CGFloat
    public let landscapeSize: CGSize?
    public let popupOption: PopupOption

    public init(view: UIView, height: CGFloat, maxWidth: CGFloat, landscapeSize: CGSize? = nil, popupOption: PopupOption) {
        self.view = view
        self.height = height
        self.maxWidth = maxWidth
        self.landscapeSize = landscapeSize
        self.popupOption = popupOption
    }
}

public struct PopupOption {
    public let shapeType: ShapeType
    public let viewType: ViewType
    public let direction: PopupViewDirection
    public let margin: CGFloat
    public let hasBlur: Bool
    public let duration: TimeInterval
    public let canTapDismiss: Bool

    public init(shapeType: ShapeType, viewType: ViewType, direction: PopupViewDirection, margin: CGFloat = 0, hasBlur: Bool = true, duration: TimeInterval = 0.3, canTapDismiss: Bool = false) {
        self.shapeType = shapeType
        self.viewType = viewType
        self.direction = direction
        self.margin = margin
        self.hasBlur = hasBlur
        self.duration = duration
        self.canTapDismiss = canTapDismiss
    }
}
