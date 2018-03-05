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
        static let landscapeSize: CGSize = CGSize(width: 500, height: 237)
    }

    private let popupItem = PopupItem(view: LoginPopupSNSView.view(),
                                      height: LoginPopupSNSView.Const.height,
                                      maxWidth: 500,
                                      landscapeSize: Const.landscapeSize,
                                      shapeType: .roundedCornerTop(cornerSize: 8),
                                      viewType: .toast,
                                      direction: .bottom,
                                      margin: 0,
                                      hasBlur: true,
                                      duration: Const.popupDuration)

    override func viewDidLoad() {
        super.viewDidLoad()
        configurePopupItem(popupItem)

        if let view = popupItem.view as? LoginPopupSNSView {
            view.closeButtonTapHandler = { [weak self] in
                self?.dismissPopupView(duration: Const.popupDuration, curve: .easeInOut, direction: .bottom) { _ in }
            }

            view.snsButtonTapHandler = { [weak self] in
                guard let me = self else { return }
                let popupItem = PopupItem(view: LoginPopupLoadView.view(),
                                          height: LoginPopupLoadView.Const.height,
                                          maxWidth: 500,
                                          shapeType: .roundedCornerTop(cornerSize: 8),
                                          viewType: .toast,
                                          direction: .bottom,
                                          margin: 0,
                                          hasBlur: true,
                                          duration: Const.popupDuration)

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

    private func showCompletionView() {
        let popupItem = PopupItem(view: LoginPopupCompletionView.view(),
                                  height: LoginPopupCompletionView.Const.height,
                                  maxWidth: 500,
                                  shapeType: .roundedCornerTop(cornerSize: 8),
                                  viewType: .toast,
                                  direction: .bottom,
                                  margin: 0,
                                  hasBlur: false,
                                  duration: Const.popupDuration)

        transformPopupView(duration: Const.transformDuration, curve: .easeInOut, popupItem: popupItem) { [weak self] _ in
            guard let me = self else { return }
            me.replacePopupView(with: popupItem)
            me.dismissPopupView(duration: 3.3, curve: .easeInOut, delayFactor: 0.9, direction: .bottom) { _ in
                PopupWindowManager.shared.changeKeyWindow(rootViewController: nil)
            }
        }
    }
}

