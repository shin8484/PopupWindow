//
//  PopupWindowManager.swift
//  PopupWindow
//
//  Created by Shinji Hayashi on 2017/12/22.
//  Copyright © 2017年 shin884. All rights reserved.
//

import UIKit

public class PopupWindowManager {
    public var popupContainerWindow: PopupContainerWindow?

    public static let shared = PopupWindowManager()
    private init() {
    }

    public func changeKeyWindow(rootViewController: UIViewController?) {
        if let rootViewController = rootViewController {
            popupContainerWindow = PopupContainerWindow()
            guard let popupContainerWindow = popupContainerWindow, rootViewController is PopupPresentable else { return }
            popupContainerWindow.frame = UIScreen.main.bounds
            popupContainerWindow.backgroundColor = .clear
            popupContainerWindow.windowLevel = UIWindowLevelStatusBar + 1
            popupContainerWindow.rootViewController = rootViewController
            popupContainerWindow.makeKeyAndVisible()
        } else {
            popupContainerWindow?.rootViewController = nil
            popupContainerWindow = nil
            UIApplication.shared.keyWindow?.makeKeyAndVisible()
        }
    }
}
