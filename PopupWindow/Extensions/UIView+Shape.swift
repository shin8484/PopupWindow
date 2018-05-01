//
//  UIView+Shape.swift
//  PopupWindow
//
//  Created by Shinji Hayashi on 2017/12/21.
//  Copyright © 2017年 shin884. All rights reserved.
//

import UIKit

extension UIView {
    func convertShape(shape: ShapeType, clips: Bool = false) {
        switch shape {
        case .normal:  break

        case .rounded(let cornerSize):
            layer.cornerRadius = cornerSize
            layer.borderWidth = 0.0
            clipsToBounds = clips

        case .roundedCornerTop(let cornerSize):
            let maskView = UIView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
            let topRoundedRect = UIView(frame: bounds)
            topRoundedRect.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            topRoundedRect.backgroundColor = .black
            topRoundedRect.clipsToBounds = true
            topRoundedRect.layer.cornerRadius = cornerSize
            maskView.addSubview(topRoundedRect)

            let bottomRect = UIView(frame: CGRect(origin: CGPoint(x: 0, y: cornerSize), size: bounds.size))
            bottomRect.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            bottomRect.backgroundColor = .black
            bottomRect.clipsToBounds = true
            maskView.addSubview(bottomRect)
            mask = maskView

        case .roundedCornerBottom(let cornerSize):
            let maskView = UIView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
            let bottomRoundedRect = UIView(frame: bounds)
            bottomRoundedRect.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            bottomRoundedRect.backgroundColor = .black
            bottomRoundedRect.clipsToBounds = true
            bottomRoundedRect.layer.cornerRadius = cornerSize
            maskView.addSubview(bottomRoundedRect)

            let topRect = UIView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: cornerSize))
            topRect.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            topRect.backgroundColor = .black
            topRect.clipsToBounds = true
            maskView.addSubview(topRect)
            mask = maskView
        }
    }
}
