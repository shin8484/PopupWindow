//
//  RegisterPopupView.swift
//  Demo
//
//  Created by Shinji Hayashi on 2018/03/03.
//  Copyright © 2018年 shin884. All rights reserved.
//

import UIKit
import PopupWindow

class RegisterPopupView: UIView, PopupViewContainable, Nibable  {
    enum Const {
        static let height: CGFloat = 369
    }

    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            closeButton.setImage(UIImage(named:"close"), for: .normal)
            closeButton.imageView?.tintColor = .gray
        }
    }

    var registerButtonTapHandler: (() -> Void)?
    var closeButtonTapHandler: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.backgroundColor()
        addDropShadow(type: .dynamic, color: .black, opacity: 0.2, radius: 3, shadowOffset: CGSize(width: 0, height: 5))
    }

    @IBAction func didTapRegisterButton() {
        registerButtonTapHandler?()
    }

    @IBAction func didTapCloseButton() {
        closeButtonTapHandler?()
    }
}
