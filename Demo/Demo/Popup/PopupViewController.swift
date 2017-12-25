//
//  PopupViewController.swift
//  WindowPopup
//
//  Created by Shinji Hayashi on 2017/12/21.
//  Copyright © 2017年 shinji hayashi. All rights reserved.
//

import UIKit
import PopupWindow

class PopupViewController: UIViewController, PopupPresentable {

    enum Const {
        static let popupDuration: TimeInterval = 0.3
        static let transformDuration: TimeInterval = 0.4
        static let popupViewFrame: CGRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: DemoPopupView.Const.height)
    }

    var popupItem: PopupItem
    
    init(popupItem: PopupItem) {
        self.popupItem = popupItem
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if let view = popupItem.view as? DemoPopupView {
            view.configureDemoPopupView(popupItem: popupItem)
            
            view.closeButtonTapHandler = { [weak self] in
                guard let me = self else { return }
                me.dismissPopupView(duration: Const.popupDuration, curve: .easeInOut, direction: me.popupItem.direction) { _ in
                    PopupWindowManager.shared.changeKeyWindow(rootViewController: nil)
                }
            }
        }

        // PopupPresentable
        setupPopupContainerView()
        makePopupView(with: popupItem)
        showPopupView(duration: Const.popupDuration, curve: .easeInOut, delayFactor: 0.0)

        DispatchQueue.main.asyncAfter( deadline: DispatchTime.now() + 3.0 ) { [weak self] in
            guard let me = self else { return }
            me.dismissPopupView(duration: Const.popupDuration, curve: .easeInOut, direction: me.popupItem.direction) { _ in }
        }
    }
}
