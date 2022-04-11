# SwiftUI-Common

SwiftUI components that seem to be highly reusable.

Since this is an **experimental library**, we recommend that you copy (or use as refererence) and use the source.

## View

- Common
  - `TextEdit` (add placeholder to `TextEditor`)
  - `WebView` (bridge to `WKWebView`)
- AppKit
  - `WindowController` (bridge to `NSWindowController`)
- UIKit
  - `ActivityView` (bridge to `UIActivityViewController`)

## Modifier

- `EnabledModifier` (`.enabled(<condition>)`)

## Protocol

- [SliderValue](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/SliderValue.swift) (e.g. for use enum in [Slider](https://developer.apple.com/documentation/swiftui/slider))

## Extension

- `NSApplication.toggleSidebar()`
- `UIApplication.hideKeyboard()`
- `Task`
  - `sleep(seconds: UInt64) async throws`
  - `sleep(milliseconds: UInt64) async throws`
- `View`
  - `#toggleSidebar()`
  - `#hideKeyboard()`
- `ViewModifier`
  - `#toggleSidebar()`
  - `#hideKeyboard()`
- [Binding](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/Binding%2B.swift)
  - `#optionalBinding() -> Binding<Value?>`
  - `#sliderBinding() -> Binding<Double> where Value: SliderValue`

## Install

If you want.

```swift
let package = Package(
    dependencies: [
        .package(url: "https://github.com/YusukeHosonuma/SwiftUI-Common.git", from: "0.1.0"),
    ],
    targets: [
        .target(name: "<your-target-name>", dependencies: [
             .product(name: "SwiftUICommon", package: "SwiftUI-Common"),
        ]),
    ]
)
```
