# STCommonWebView

[![Language](https://img.shields.io/badge/language-Swift-limegreen.svg?style=flat)](http://cocoapods.org/pods/STCommonWebView)
[![Platform](https://img.shields.io/cocoapods/p/STCommonWebView.svg?style=flat)](http://cocoapods.org/pods/STCommonWebView)
[![Version](https://img.shields.io/cocoapods/v/STCommonWebView.svg?style=flat)](http://cocoapods.org/pods/STCommonWebView)
[![License](https://img.shields.io/cocoapods/l/STCommonWebView.svg?style=flat)](http://cocoapods.org/pods/STCommonWebView)

## A common subclass of WKWebView

STCommonWebView is a common subclass of WKWebView.

## Requirements

- iOS 9.0 or later  (For iOS 9.0 before, maybe it can work, but I have not tested.)
- ARC
- Swift 5.0

## Installation

STCommonWebView is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'STCommonWebView'
```

## Usage

### Import headers in your source files

In the source files where you need to use the library, import the header file:

```swift
import STCommonWebView
```

### Initialize STCommonWebView

STCommonWebView is a subclass of WKWebView. You can initialize it like WKWebView:

```swift
STCommonWebView(frame: frame)
```

## Author

Suta, shien7654321@163.com

## License

[MIT]: http://www.opensource.org/licenses/mit-license.php
[MIT license][MIT].
