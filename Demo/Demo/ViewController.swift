//
//  ViewController.swift
//  Demo
//
//  Created by Shinji Hayashi on 2017/12/22.
//  Copyright © 2017年 shin884. All rights reserved.
//

import UIKit
import PopupWindow

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    @available(iOS 11.0, *)
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        tableView.contentInset.bottom = view.safeAreaInsets.bottom
        tableView.contentInset.top = view.safeAreaInsets.top
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoPopupCell", for: indexPath) as! DemoPopupCell

        if indexPath.row == 0 {
            cell.titleLabel.text = "TopToast"
            cell.descriptionLabel.text = "Display a square toast view from the top of the screen."

        } else if indexPath.row == 1 {
            cell.titleLabel.text = "BottomToast"
            cell.descriptionLabel.text = "Display a square toast view from the bottom of the screen."

        } else if indexPath.row == 2 {
            cell.titleLabel.text = "TopCardPopup"
            cell.descriptionLabel.text = "Display a rounded popup view from the top of the screen."

        } else if indexPath.row == 3 {
            cell.titleLabel.text = "BottomCardPopup"
            cell.descriptionLabel.text = "Display a rounded popup view from the bottom of the screen."

        } else if indexPath.row == 4 {
            cell.titleLabel.text = "EXAMPLE"
            cell.descriptionLabel.text = "Here is an example of popup login using POPUPWINDOW"
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if indexPath.row == 0 {
            let popupItem = PopupItem(view: DemoToastView.view(), frame: ToastViewController.Const.toastViewFrame, type: .normal, direction: .top, margin: 0, hasBlur: false)
            PopupWindowManager.shared.changeKeyWindow(rootViewController:  ToastViewController(popupItem: popupItem))


        } else if indexPath.row == 1 {
            let popupItem = PopupItem(view: DemoToastView.view(), frame: ToastViewController.Const.toastViewFrame, type: .normal, direction: .bottom, margin: 0, hasBlur: false)
            PopupWindowManager.shared.changeKeyWindow(rootViewController:  ToastViewController(popupItem: popupItem))

        } else if indexPath.row == 2 {
            let popupItem = PopupItem(view: DemoPopupView.view(), frame: PopupViewController.Const.popupViewFrame, type: .rounded(cornerSize: 10), direction: .top, margin: 16, hasBlur: true)
            PopupWindowManager.shared.changeKeyWindow(rootViewController:  PopupViewController(popupItem: popupItem))

        } else if indexPath.row == 3 {
            let popupItem = PopupItem(view: DemoPopupView.view(), frame: PopupViewController.Const.popupViewFrame, type: .rounded(cornerSize: 10), direction: .bottom, margin: 16, hasBlur: true)
            PopupWindowManager.shared.changeKeyWindow(rootViewController:  PopupViewController(popupItem: popupItem))

        } 
    }
}
