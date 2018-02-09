//
//  DemoToastView.swift
//  Demo
//
//  Created by Shinji Hayashi on 2017/12/22.
//  Copyright © 2017年 shin884. All rights reserved.
//

import UIKit
import PopupWindow

class DemoToastView: UIView, PopupViewContainable, Nibable {
    enum Const {
        static let height: CGFloat = 80
    }

    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var closeButtonTapHandler: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .black
        alpha = 0.85
    }

    func configureDemoToastView(popupItem: PopupItem) {
        titleLabel.text = popupItem.direction == .top ? "TOP" : "BOTTOM"
        descriptionLabel.text = "It disappears after 3 seconds."
        titleLabel.textColor = .white
        descriptionLabel.textColor = .white
    }
}
