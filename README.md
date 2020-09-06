### MMModalWebViewController is an elegant and customizable ViewController to present a website on iOS.

<p align="center">
    <img src="https://img.shields.io/badge/Platform-iOS_11+-green.svg" alt="Platform: iOS 11.0+" />
    <a href="https://developer.apple.com/swift" target="_blank"><img src="https://img.shields.io/badge/Language-Swift_5-blueviolet.svg" alt="Language: Swift 5" /></a>
    <a href="https://cocoapods.org/pods/MMModalWebViewController" target="_blank"><img src="https://img.shields.io/badge/CocoaPods-v1.0-red.svg" alt="CocoaPods compatible" /></a>
    <a href="https://github.com/Carthage/Carthage" target="_blank"><img src="https://img.shields.io/badge/Carthage-compatible-blue.svg" alt="Carthage compatible" /></a>
    <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License: MIT" />
</p>

## Compatibility

MMModalWebViewController requires **iOS 11+** and is compatible with **Swift 5** projects.

## Installation

* <a href="https://guides.cocoapods.org/using/using-cocoapods.html" target="_blank">CocoaPods</a>:

```ruby
pod 'MMModalWebViewController'
```

* <a href="https://github.com/Carthage/Carthage" target="_blank">Carthage</a>:

```ruby
github "mammutmedia/MMModalWebViewController"
```
## Usage

MMModalWebViewController was designed to be used without pain. Just set the configuration and present the ViewController.

```swift
import MMModalWebViewController

let config = MMConfig
present(url: URL(string: "https://github.com")!, configuration: config)
```

### Configuration

```swift
/// Use this property to modify the default icons.
icons = MMIcons()
/// Use this property to modify the tint of the header items. Defaults to .labelColor / .black
tint: UIColor?
/// Use this property to modify the text color of the url in the header. Defaults to .systemGray2 / R:174 G:174 B:178
urlColor: UIColor?
/// Use this property to modify the background color of the controller. Defaults to .systemBackground / .white
backgroundColor: UIColor?
/// Use this property to show or hide the back and forward buttons. Defaults to true
showNavigation: Bool = true
/// Use this property to modify the loading text. Defaults to "Loading..."
loadingText: String = "Loading..."
/// Use this property to modify the progress bar color. Defaults to .blue
progressBarColor: UIColor = .blue
/// Use this property to modify the corner radius. Defaults to 16.0
cornerRadius: CGFloat = 16.0
/// Use this property to modify the top margin. Defaults to 40.0
topMargin: CGFloat = 40.0
/// Use this property to set the delegate
controllerDelegate: MMModalWebViewControllerDelegate?
```

### Delegates

```swift
extension ViewController: MMModalWebViewControllerDelegate {
    func willAppear(_ webViewController: MMModalWebViewController, webView: WKWebView) {
        print(#function)
    }

    func didAppear(_ webViewController: MMModalWebViewController, webView: WKWebView) {
        print(#function)
    }

    func willDisappear(_ webViewController: MMModalWebViewController, webView: WKWebView) {
        print(#function)
    }

    func didDisappear(_ webViewController: MMModalWebViewController, webView: WKWebView) {
        print(#function)
    }

    func contentDidLoad(_ webViewController: MMModalWebViewController, webView: WKWebView) {
        print(#function)
    }
}
```

## Contributing

We're glad to be open sourcing this library. We use it in many own projects.

We will only be fixing critical bugs, thus, for any non-critical issues or feature requests we hope to be able to rely on the community using the library to add what they need.

## Authors

[Felix Nithammer](https://github.com/Mammut-Felix)

## License

<b>MMModalWebViewController</b> is released under a MIT License. See LICENSE file for details.
