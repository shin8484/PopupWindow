//
//  LoginPopupViewController.swift
//  WindowPopup
//
//  Created by Shinji Hayashi on 2017/12/15.
//  Copyright © 2017年 shinji hayashi. All rights reserved.
//

import UIKit
import PopupWindow

class LoginPopupViewController: BasePopupViewController {
    enum Const {
        static let popupDuration: TimeInterval = 0.3
        static let transformDuration: TimeInterval = 0.4
        static let maxWidth: CGFloat = 500
        static let landscapeSize: CGSize = CGSize(width: maxWidth, height: 237)
        static let popupOption = PopupOption(shapeType: .roundedCornerTop(cornerSize: 8), viewType: .toast, direction: .bottom, canTapDismiss: true)
        static let popupLoadingOption = PopupOption(shapeType: .roundedCornerTop(cornerSize: 8), viewType: .toast, direction: .bottom)
        static let popupCompletionOption = PopupOption(shapeType: .roundedCornerTop(cornerSize: 8), viewType: .toast, direction: .bottom, hasBlur: false)
    }

    let popupView = LoginPopupSNSView.view()
    let loadView = LoginPopupLoadView.view()
    let completionView = LoginPopupCompletionView.view()

    override func viewDidLoad() {
        super.viewDidLoad()

        let popupItem = PopupItem(view: popupView, height: LoginPopupSNSView.Const.height, maxWidth: Const.maxWidth, landscapeSize: Const.landscapeSize, popupOption: Const.popupOption)
        configurePopupItem(popupItem)

        popupView.closeButtonTapHandler = { [weak self] in
            self?.dismissPopupView(duration: Const.popupDuration, curve: .easeInOut, direction: .bottom) { _ in }
        }

        popupView.snsButtonTapHandler = { [weak self] in
            guard let me = self else { return }
            let popupItem = PopupItem(view: me.loadView, height: LoginPopupLoadView.Const.height, maxWidth: Const.maxWidth, popupOption: Const.popupLoadingOption)

            me.transformPopupView(duration: Const.transformDuration, curve: .easeInOut, popupItem: popupItem) { [weak self] _ in
                guard let me = self else { return }
                me.replacePopupView(with: popupItem)
                DispatchQueue.main.asyncAfter( deadline: DispatchTime.now() + 3.0 ) {
                    me.showCompletionView()
                }
            }
        }
    }

    private func showCompletionView() {
        let popupItem = PopupItem(view: completionView,
                                  height: LoginPopupCompletionView.Const.height,
                                  maxWidth: Const.maxWidth,
                                  popupOption: Const.popupCompletionOption)

        transformPopupView(duration: Const.transformDuration, curve: .easeInOut, popupItem: popupItem) { [weak self] _ in
            guard let me = self else { return }
            me.replacePopupView(with: popupItem)
            me.dismissPopupView(duration: 3.3, curve: .easeInOut, delayFactor: 0.9, direction: .bottom) { _ in
                PopupWindowManager.shared.changeKeyWindow(rootViewController: nil)
            }
        }
    }
}

