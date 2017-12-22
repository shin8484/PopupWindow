//
//  UIView+Shadow.swift
//  Demo
//
//  Created by Shinji Hayashi on 2017/12/22.
//  Copyright © 2017年 shin884. All rights reserved.
//

import UIKit

enum DropShadowType {
    case rect, circle, dynamic
}

extension UIView {
    func addDropShadow(type: DropShadowType = .dynamic, color: UIColor = UIColor.black, opacity: Float = 0.3, radius: CGFloat = 4.0, shadowOffset: CGSize = CGSize.zero) {
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = shadowOffset
        layer.shadowColor = color.cgColor

        switch type {
        case .circle:
            let halfWidth = frame.size.width * 0.5
            layer.shadowPath = UIBezierPath(arcCenter: CGPoint(x: halfWidth, y: halfWidth), radius: halfWidth, startAngle: 0.0, endAngle: CGFloat.pi * 2, clockwise: true).cgPath
            layer.shouldRasterize = true
            layer.rasterizationScale = UIScreen.main.scale
        case .rect:
            layer.shadowPath = UIBezierPath(roundedRect: frame, cornerRadius: layer.cornerRadius).cgPath
            layer.shouldRasterize = true
        case .dynamic:
            layer.shouldRasterize = true
            layer.rasterizationScale = UIScreen.main.scale
        }
    }
}
