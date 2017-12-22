//
//  LoginPopupSNSView.swift
//  Demo
//
//  Created by Shinji Hayashi on 2017/12/22.
//  Copyright © 2017年 shin884. All rights reserved.
//

import UIKit
import PopupWindow

class LoginPopupSNSView: UIView, PopupViewCotainable, Nibable {
    enum Const {
        static let height: CGFloat = 250
        static let buttonInset: CGFloat = 20
    }

    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var twitterButton: UIButton! {
        didSet {
            twitterButton.setImage(UIImage(named:"twitter")?.withRenderingMode(.alwaysTemplate), for: .normal)
            twitterButton.imageView?.tintColor = UIColor.rgba(r: 85, g: 172, b: 238, alpha: 1.0)
            twitterButton.layer.cornerRadius = twitterButton.frame.height / 2
            twitterButton.imageEdgeInsets = UIEdgeInsets(top: Const.buttonInset, left: Const.buttonInset, bottom: Const.buttonInset, right: Const.buttonInset)
        }
    }
    @IBOutlet weak var facebookButton: UIButton! {
        didSet {
            facebookButton.setImage(UIImage(named:"facebook")?.withRenderingMode(.alwaysTemplate), for: .normal)
            facebookButton.imageView?.tintColor = UIColor.rgba(r: 56, g: 89, b: 152, alpha: 1.0)
            facebookButton.layer.cornerRadius = facebookButton.frame.height / 2
            facebookButton.imageEdgeInsets = UIEdgeInsets(top: Const.buttonInset, left: Const.buttonInset, bottom: Const.buttonInset, right: Const.buttonInset)
        }
    }
    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            closeButton.setImage(UIImage(named:"close"), for: .normal)
            closeButton.imageView?.tintColor = .gray
        }
    }

    var snsButtonTapHandler: (() -> Void)?
    var closeButtonTapHandler: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.backgroundColor()
        addDropShadow(type: .dynamic, color: .black, opacity: 0.2, radius: 3, shadowOffset: CGSize(width: 0, height: 5))
    }

    @IBAction func didTapSNSButton() {
        snsButtonTapHandler?()
    }

    @IBAction func didTapCloseButton() {
        closeButtonTapHandler?()
    }
}

