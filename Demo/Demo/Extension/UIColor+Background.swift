//
//  UIColor+Background.swift
//  Demo
//
//  Created by Shinji Hayashi on 2017/12/22.
//  Copyright © 2017年 shin884. All rights reserved.
//

import UIKit

extension UIColor {
    class func rgba(r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    class func backgroundColor() -> UIColor {
        return UIColor.rgba(r: 235, g: 235, b: 235, alpha: 1.0)
    }
}
