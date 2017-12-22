//
//  UIView+Shape.swift
//  PopupWindow
//
//  Created by Shinji Hayashi on 2017/12/21.
//  Copyright © 2017年 shin884. All rights reserved.
//

import UIKit

extension UIView {
    func convertShape(shape: PopupViewType, clips: Bool = false) {
        switch shape {
        case .normal:  break

        case .rounded(let cornerSize):
            layer.cornerRadius = cornerSize
            layer.borderWidth = 0.0
            clipsToBounds = clips

        case .roundedCornerTop(let cornerSize):
            let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerSize, height: cornerSize))
            let maskLayer = CAShapeLayer()
            maskLayer.path = maskPath.cgPath
            layer.mask = maskLayer

        case .roundedCornerBottom(let cornerSize):
            let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: cornerSize, height: cornerSize))
            let maskLayer = CAShapeLayer()
            maskLayer.path = maskPath.cgPath
            layer.mask = maskLayer
        }
    }
}
