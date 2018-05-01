//
//  LoginPopupLoadView.swift
//  Demo
//
//  Created by Shinji Hayashi on 2017/12/22.
//  Copyright © 2017年 shin884. All rights reserved.
//

import UIKit
import PopupWindow

class LoginPopupLoadView: UIView, PopupViewContainable, Nibable {
    enum Const {
        static let height: CGFloat = 150
    }

    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var waitlabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 4
        backgroundColor = UIColor.backgroundColor()
        addDropShadow(type: .dynamic, color: .black, opacity: 0.2, radius: 3, shadowOffset: CGSize(width: 0, height: 5))
        activityIndicator.startAnimating()
    }
}
