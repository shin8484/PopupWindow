//
//  ToastViewController.swift
//  WindowPopup
//
//  Created by Shinji Hayashi on 2017/12/21.
//  Copyright © 2017年 shinji hayashi. All rights reserved.
//

import UIKit
import PopupWindow

class ToastViewController: BasePopupViewController {

    enum Const {
        static let popupDuration: TimeInterval = 0.3
        static let transformDuration: TimeInterval = 0.4
        static let toastViewFrame: CGRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: DemoToastView.Const.height)
    }

    var isTop: Bool = true
    private var popupItem: PopupItem?

    private let topPopupItem = PopupItem(view: DemoToastView.view(),
                                         frame: ToastViewController.Const.toastViewFrame,
                                         type: .normal,
                                         direction: .top,
                                         margin: 0, hasBlur: false,
                                         duration: Const.popupDuration)

    private let bottomPopupItem = PopupItem(view: DemoToastView.view(),
                                            frame: ToastViewController.Const.toastViewFrame,
                                            type: .normal,
                                            direction: .bottom,
                                            margin: 0, hasBlur: false,
                                            duration: Const.popupDuration)

    override func viewDidLoad() {
        super.viewDidLoad()
        if isTop {
            popupItem = topPopupItem
            configurePopupItem(popupItem!)
        } else {
            popupItem = bottomPopupItem
            configurePopupItem(popupItem!)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if let popupItem = popupItem, let view = popupItem.view as? DemoToastView {
            view.configureDemoToastView(popupItem: popupItem)
        }

        DispatchQueue.main.asyncAfter( deadline: DispatchTime.now() + 3.0 ) { [weak self] in
            guard let me = self, let popupItem = me.popupItem else { return }
            me.dismissPopupView(duration: Const.popupDuration, curve: .easeInOut, direction: popupItem.direction) { _ in
                PopupWindowManager.shared.changeKeyWindow(rootViewController: nil)
            }
        }
    }
}
