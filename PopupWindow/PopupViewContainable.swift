//
//  PopupViewContainable.swift
//  PopupWindow
//
//  Created by Shinji Hayashi on 2017/12/22.
//  Copyright © 2017年 shin884. All rights reserved.
//

import UIKit

public protocol PopupViewContainable {
    weak var containerView: UIView! { get }
}
