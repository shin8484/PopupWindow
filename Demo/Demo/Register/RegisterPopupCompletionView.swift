//
//  RegisterPopupCompletionView.swift
//  Demo
//
//  Created by Shinji Hayashi on 2018/03/03.
//  Copyright © 2018年 shin884. All rights reserved.
//

import UIKit
import PopupWindow

class RegisterPopupCompletionView: UIView, PopupViewContainable, Nibable {
    enum Const {
        static let height: CGFloat = 64
    }

    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.masksToBounds = true
        }
    }

    @IBOutlet weak var boldLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 4
        backgroundColor = UIColor.backgroundColor()
        addDropShadow(type: .dynamic, color: .black, opacity: 0.2, radius: 3, shadowOffset: CGSize(width: 0, height: 5))
        boldLabel.text = "Register finished"
    }
}
