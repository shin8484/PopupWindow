# PopupWindow

[![Version](https://img.shields.io/cocoapods/v/NoticeObserveKit.svg?style=flat)](http://cocoapods.org/pods/PopupWindow)
[![License](https://img.shields.io/cocoapods/l/NoticeObserveKit.svg?style=flat)](http://cocoapods.org/pods/PopupWindow)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/NoticeObserveKit.svg?style=flat)](http://cocoapods.org/pods/PopupWindow)

![image](https://github.com/shin8484/PopupWindow/raw/master/Demo/Asset/PopupWindow.png)

PopupWindow is a simple Popup using another UIWindow


## Feature
- PopupWindow can be displayed at the top or bottom of the screen.
- Popup can set margins, cornerRadius, blur, etc.
- When displaying blur, you can't  touch the below contents.
- By erasing blur, you can touch the below contents.
- Popup are displayed on another window, so you can leave Popup even when screen transitions.

TopToast | BottomToast | TopCard | BottomCard | Example
--- | --- | --- | --- | ---
![demo_01](https://github.com/shin8484/PopupWindow/raw/master/Demo/Asset/TopToast.gif) | ![demo_02](https://github.com/shin8484/PopupWindow/raw/master/Demo/Asset/BottomToast.gif) | ![demo_03](https://github.com/shin8484/PopupWindow/raw/master/Demo/Asset/TopCard.gif) | ![demo_04](https://github.com/shin8484/PopupWindow/raw/master/Demo/Asset/BottomCard.gif) | ![demo_05](https://github.com/shin8484/PopupWindow/raw/master/Demo/Asset/Example.gif)

## Installation

### CocoaPods

Add PopupWindow to your Podfile:
```
pod 'PopupWindow'
```

### Carthage
Add PopupWindow to your Cartfile:
```
github "shin8484/PopupWindow"
```

## Usage

When displaying popup in another window, please call first `PopupWindowManager` `changeKeyWindow(rootViewController: UIViewController)`

```Swift
PopupWindowManager.shared.changeKeyWindow(rootViewController: UIViewController())
```

### Create and show show

Create a PopupItem in the ViewController where you want to display the popup and call the method of BasePopupViewController

```Swift
let popupOption = PopupOption(shapeType: .roundedCornerTop(cornerSize: 8), viewType: .toast, direction: .bottom)
let popupItem = PopupItem(view: loginView,
                          height: Const.firstViewFrame.height,
                          maxWidth: 500,
                          popupOption: popupOption)
```
First popup implementation is included in BasePopupViewController's `loadView`, `viewDidAppear`.
If you want to create the next popup, please call `showPopupView()`.

```Swift
class SampleViewController: BasePopupViewController {
    override open func loadView() {
        super.loadView()
        setupPopupContainerView()
    }

    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        makePopupView(with: item)
        showPopupView(duration: item.duration, curve: .easeInOut, delayFactor: 0.0)
    }
}
```

### Transform & Replace

Replace the display contents, and perform deformation to the specified size.
By using `PopupItem`, you can specify content contents and size.

```Swift
transformPopupView(duration: Const.transformDuration, curve: .easeInOut, popupItem: popupItem) { [weak self] _ in
    guard let me = self else { return }
    me.replacePopupView(with: popupItem)
    me.dismissPopupView(duration: 3.3, curve: .easeInOut, delayFactor: 0.9, direction: .top) { _ in }
}
```

### Dismiss
Specify hide animation direction with `PopupViewDirection`
```Swift
dismissPopupView(duration: 3.3, curve: .easeInOut, delayFactor: 0.9, direction: .bottom) { _ in
    PopupWindowManager.shared.changeKeyWindow(rootViewController: nil)
}
```

### PopupItem
PopupItem and PopupOption are struct to set up a popup, View, size, direction, whether it is rounded, margin, blurred or not, duration, maxWidth, type

```Swift
public struct PopupItem {
    public let view: UIView
    public let height: CGFloat
    public let maxWidth: CGFloat
    public let landscapeSize: CGSize?
    public let popupOption: PopupOption
}
```
```Swift
public struct PopupOption {
    public let shapeType: ShapeType
    public let viewType: ViewType
    public let direction: PopupViewDirection
    public let margin: CGFloat
    public let hasBlur: Bool
    public let duration: TimeInterval
    public let canTapDismiss: Bool
}
```
## Landscape
### maxWidth
By setting maxWidth with popupitem's initializer, you can set the maximum width of the popup in landscape mode.

![image](https://github.com/shin8484/PopupWindow/raw/master/Demo/Asset/Landscape.png)

### landscapeSize
You can set popup size at landscape.
The size changes only when landscape size is set, and the default is nil.
Using landscapeSize and SizeClass, you can customize PopupVIew that has the widest width like GIF below when rotating.

![demo_06](https://github.com/shin8484/PopupWindow/raw/master/Demo/Asset/RegisterExample.gif)

## Requirements
- iOS 10.0+
- Xcode 9.1+
- Swift 3.0.1+

## LICENSE

Under the MIT license. See LICENSE file for details.

