//
//  PopupViewType.swift
//  Pods-Demo
//
//  Created by Shinji Hayashi on 2017/12/22.
//

import UIKit

public enum PopupViewType {
    //Corner square
    case normal

    //Corner rounded
    case rounded(cornerSize: CGFloat)

    //Corner rounded only top
    case roundedCornerTop(cornerSize: CGFloat)

    //Corner rounded only bottom
    case roundedCornerBottom(cornerSize: CGFloat)
}
