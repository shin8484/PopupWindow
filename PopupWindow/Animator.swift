//
//  Animator.swift
//  Pods-Demo
//
//  Created by Shinji Hayashi on 2018/05/30.
//

import UIKit

public final class Easing: UICubicTimingParameters {
    convenience init(_ c1x: CGFloat, _ c1y: CGFloat, _ c2x: CGFloat, _ c2y: CGFloat) {
        self.init(controlPoint1: CGPoint(x: c1x, y: c1y), controlPoint2: CGPoint(x: c2x, y: c2y))
    }

    public static let linear =         Easing(animationCurve: .linear)
    public static let easeIn =         Easing(animationCurve: .easeIn)
    public static let easeOut =        Easing(animationCurve: .easeOut)
    public static let easeInOut =      Easing(animationCurve: .easeInOut)
    public static let easeInSine =     Easing(0.47, 0, 0.745, 0.715)
    public static let easeOutSine =    Easing(0.39, 0.575, 0.565, 1)
    public static let easeInOutSine =  Easing(0.455, 0.03, 0.515, 0.955)
    public static let easeInQuad =     Easing(0.55, 0.085, 0.68, 0.53)
    public static let easeOutQuad =    Easing(0.25, 0.46, 0.45, 0.94)
    public static let easeInOutQuad =  Easing(0.455, 0.03, 0.515, 0.955)
    public static let easeInCubic =    Easing(0.55, 0.055, 0.675, 0.19)
    public static let easeOutCubic =   Easing(0.215, 0.61, 0.355, 1)
    public static let easeInOutCubic = Easing(0.645, 0.045, 0.355, 1)
    public static let easeInQuart =    Easing(0.895, 0.03, 0.685, 0.22)
    public static let easeOutQuart =   Easing(0.165, 0.84, 0.44, 1)
    public static let easeInOutQuart = Easing(0.77, 0, 0.175, 1)
    public static let easeInQuint =    Easing(0.755, 0.05, 0.855, 0.06)
    public static let easeOutQuint =   Easing(0.23, 1, 0.32, 1)
    public static let easeInOutQuint = Easing(0.86, 0, 0.07, 1)
    public static let easeInExpo =     Easing(0.95, 0.05, 0.795, 0.035)
    public static let easeOutExpo =    Easing(0.19, 1, 0.22, 1)
    public static let easeInOutExpo =  Easing(1, 0, 0, 1)
    public static let easeInCirc =     Easing(0.6, 0.04, 0.98, 0.335)
    public static let easeOutCirc =    Easing(0.075, 0.82, 0.165, 1)
    public static let easeInOutCirc =  Easing(0.785, 0.135, 0.15, 0.86)
    public static let easeInBack =     Easing(0.6, -0.28, 0.735, 0.045)
    public static let easeOutBack =    Easing(0.175, 0.885, 0.32, 1.275)
    public static let easeInOutBack =  Easing(0.68, -0.55, 0.265, 1.55)
}

public class Animator: UIViewPropertyAnimator {
    convenience init(duration: TimeInterval, easing: Easing) {
        self.init(duration: duration, timingParameters: easing)
    }
}
