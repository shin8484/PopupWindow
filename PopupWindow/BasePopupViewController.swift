//
//  BasePopupViewController.swift
//  PopupWindow
//
//  Created by Shinji Hayashi on 2018/02/08.
//  Copyright © 2018年 shin884. All rights reserved.
//

import UIKit

open class BasePopupViewController: UIViewController {

    private var item: PopupItem?

    private var safeAreaInsets: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets
        } else {
            return .zero
        }
    }

    private var screen: CGRect {
        return UIScreen.main.bounds
    }

    override open func loadView() {
        super.loadView()
        setupPopupContainerView()
    }

    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let item = item else { return }
        makePopupView(with: item)
        showPopupView(duration: item.duration, curve: .easeInOut, delayFactor: 0.0)
    }

    public func configurePopupItem(_ popupItem: PopupItem) {
        item = popupItem
    }

    public func setupPopupContainerView() {
        view = PopupContainerView()
        view.backgroundColor = .clear
    }

    public func makePopupView(with popupItem: PopupItem) {
        let frame: CGRect
        switch popupItem.direction {
        case .top:
            frame = CGRect(x: popupItem.frame.origin.x + popupItem.margin, y: -popupItem.frame.height, width: popupItem.frame.width - popupItem.margin * 2, height: popupItem.frame.height)
            popupItem.view.frame = frame.addTopInset(safeAreaInsets)
        case .bottom:
            frame = CGRect(x: popupItem.frame.origin.x + popupItem.margin, y: screen.height, width: popupItem.frame.width - popupItem.margin * 2, height: popupItem.frame.height)
            popupItem.view.frame = frame.addBottomInset(safeAreaInsets)
        }

        item = popupItem
        convertShape(with: popupItem)

        view.addSubview(popupItem.view)
    }

    public func replacePopupView(with popupItem: PopupItem) {
        guard let item = item else { return }
        item.view.removeFromSuperview()
        popupItem.view.frame = addFrame(with: popupItem)
        (popupItem.view as? PopupViewContainable)?.containerView.alpha = 0.0
        view.addSubview(popupItem.view)

        self.item = popupItem
        addBlur(with: popupItem)
        convertShape(with: popupItem)

        let animator = UIViewPropertyAnimator(duration: 0.3, curve: .linear)
        animator.addAnimations() {
            (popupItem.view as? PopupViewContainable)?.containerView.alpha = 1.0
        }
        animator.startAnimation()
    }

    public func showPopupView(duration: TimeInterval, curve: UIViewAnimationCurve, delayFactor: CGFloat) {
        let animator = UIViewPropertyAnimator(duration: duration, curve: curve)
        animator.addAnimations({ [weak self] in
            guard let me = self, let item = me.item else { return }
            item.view.frame = me.addFrame(with: item)
        }, delayFactor: delayFactor)
        animator.startAnimation()

        let backgroundAnimator = UIViewPropertyAnimator(duration: duration, curve: curve)
        backgroundAnimator.addAnimations({ [weak self] in
            guard let me = self, let item = me.item else { return }
            me.addBlur(with: item)
        }, delayFactor: delayFactor)
        backgroundAnimator.startAnimation()
    }

    public func transformPopupView(duration: TimeInterval, curve: UIViewAnimationCurve, popupItem: PopupItem, completion: @escaping ((UIViewAnimatingPosition) -> Void)) {
        let animator = UIViewPropertyAnimator(duration: duration, curve: curve)
        animator.addAnimations() { [weak self] in
            guard let me = self, let item = me.item else { return }
            me.addBlur(with: popupItem)
            item.view.frame = me.addFrame(with: popupItem)
            (item.view as? PopupViewContainable)?.containerView.alpha = 0
        }
        animator.addCompletion() { position in
            completion(position)
        }
        animator.startAnimation()
    }

    public func dismissPopupView(duration: TimeInterval, curve: UIViewAnimationCurve, delayFactor: CGFloat = 0.0, direction: PopupViewDirection, completion: @escaping ((UIViewAnimatingPosition) -> Void)) {
        let animator = UIViewPropertyAnimator(duration: duration, curve: curve)
        animator.addAnimations({ [weak self] in
            guard let me = self, let item = me.item else { return }
            me.view.backgroundColor = .clear
            switch direction {
            case .top: item.view.frame.origin.y = -item.view.frame.height
            case .bottom: item.view.frame.origin.y = me.view.bounds.height
            }
        }, delayFactor: delayFactor)
        
        animator.addCompletion() { position in
            PopupWindowManager.shared.changeKeyWindow(rootViewController: nil)
            completion(position)
        }
        animator.startAnimation()
    }

    private func addFrame(with popupItem: PopupItem) -> CGRect {
        let frame: CGRect
        switch popupItem.direction {
        case .top:
            frame = CGRect(x: popupItem.frame.origin.x + popupItem.margin, y: popupItem.margin + popupItem.frame.origin.y, width: popupItem.frame.width - popupItem.margin * 2, height: popupItem.frame.height)
            return frame.addTopInset(safeAreaInsets)

        case .bottom:
            frame = CGRect(x: popupItem.frame.origin.x + popupItem.margin, y: screen.height - popupItem.frame.height - popupItem.margin, width: popupItem.frame.width - popupItem.margin * 2, height: popupItem.frame.height)
            return frame.addBottomInset(safeAreaInsets)
        }
    }

    private func convertShape(with popupItem: PopupItem) {
        popupItem.view.convertShape(shape: popupItem.type)
    }

    private func addBlur(with popupItem: PopupItem) {
        if popupItem.hasBlur {
            view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            (view as? PopupContainerView)?.isAbleToTouchLower = false
        } else {
            view.backgroundColor = UIColor.clear
            (view as? PopupContainerView)?.isAbleToTouchLower = true
        }
    }
}
