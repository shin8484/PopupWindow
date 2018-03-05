//
//  RegisterPopupViewController.swift
//  Demo
//
//  Created by Shinji Hayashi on 2018/03/03.
//  Copyright © 2018年 shin884. All rights reserved.
//


import UIKit
import PopupWindow

class RegisterPopupViewController: BasePopupViewController {
    enum Const {
        static let popupDuration: TimeInterval = 0.3
        static let transformDuration: TimeInterval = 0.4
        static let landscapeSize: CGSize = CGSize(width: 500, height: 249)
    }

    private let popupItem = PopupItem(view: RegisterPopupView.view(),
                                      height: RegisterPopupView.Const.height,
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

        if let view = popupItem.view as? RegisterPopupView {
            view.closeButtonTapHandler = { [weak self] in
                self?.dismissPopupView(duration: Const.popupDuration, curve: .easeInOut, direction: .bottom) { _ in }
            }

            view.registerButtonTapHandler = { [weak self] in
                guard let me = self else { return }
                me.showCompletionView()
            }
        }
    }

    private func showCompletionView() {
        let popupItem = PopupItem(view: RegisterPopupCompletionView.view(),
                                  height: RegisterPopupCompletionView.Const.height,
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

