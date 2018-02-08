//
//  LoginPopupViewController.swift
//  WindowPopup
//
//  Created by Shinji Hayashi on 2017/12/15.
//  Copyright © 2017年 shinji hayashi. All rights reserved.
//

import UIKit
import PopupWindow

class LoginPopupViewController: UIViewController, PopupPresentable {

    enum Const {
        static let popupDuration: TimeInterval = 0.3
        static let transformDuration: TimeInterval = 0.4

        static let firstViewFrame: CGRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: LoginPopupSNSView.Const.height)
        static let loadingFrame: CGRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: LoginPopupLoadView.Const.height)
        static let completionFrame: CGRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: LoginPopupCompletionView.Const.height)
    }

    var popupItem: PopupItem = PopupItem(view: LoginPopupSNSView.view(),
                                         frame: Const.firstViewFrame,
                                         type: .rounded(cornerSize: 8),
                                         direction: .bottom,
                                         margin: 8,
                                         hasBlur: true)

    override func loadView() {
        super.loadView()
        // PopupPresentable
        setupPopupContainerView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = popupItem.view as? LoginPopupSNSView {
            view.closeButtonTapHandler = { [weak self] in
                self?.dismissPopupView(duration: Const.popupDuration, curve: .easeInOut, direction: .bottom) { _ in }
            }

            view.snsButtonTapHandler = { [weak self] in
                guard let me = self else { return }
                let popupItem = PopupItem(view: LoginPopupLoadView.view(), frame: Const.loadingFrame, type: .rounded(cornerSize: 8), direction: .bottom, margin: 8, hasBlur: true)
                me.transformPopupView(duration: Const.transformDuration, curve: .easeInOut, popupItem: popupItem) { [weak self] _ in
                    guard let me = self else { return }
                    me.replacePopupView(with: popupItem)
                    DispatchQueue.main.asyncAfter( deadline: DispatchTime.now() + 3.0 ) {
                        me.showCompletionView()
                    }
                }
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // PopupPresentable
        makePopupView(with: popupItem)
        showPopupView(duration: Const.popupDuration, curve: .easeInOut, delayFactor: 0.0)
    }

    private func showCompletionView() {
        let popupItem = PopupItem(view: LoginPopupCompletionView.view(), frame: Const.completionFrame, type: .rounded(cornerSize: 8), direction: .bottom, margin: 8, hasBlur: false)
        transformPopupView(duration: Const.transformDuration, curve: .easeInOut, popupItem: popupItem) { [weak self] _ in
            guard let me = self else { return }
            me.replacePopupView(with: popupItem)
            me.dismissPopupView(duration: 3.3, curve: .easeInOut, delayFactor: 0.9, direction: .bottom) { _ in
                PopupWindowManager.shared.changeKeyWindow(rootViewController: nil)
            }
        }
    }
}

