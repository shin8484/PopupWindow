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

    private var popupItem: PopupItem

    override init(popupItem: PopupItem) {
        self.popupItem = popupItem
        super.init(popupItem: popupItem)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if let view = popupItem.view as? DemoToastView {
            view.configureDemoToastView(popupItem: popupItem)
        }

        DispatchQueue.main.asyncAfter( deadline: DispatchTime.now() + 3.0 ) { [weak self] in
            guard let me = self else { return }
            me.dismissPopupView(duration: Const.popupDuration, curve: .easeInOut, direction: me.popupItem.direction) { _ in
                PopupWindowManager.shared.changeKeyWindow(rootViewController: nil)
            }
        }
    }
}
