# SwiftUI-Common

SwiftUI components and extensions that seem to be highly reusable.

Since this is an **experimental library**, we recommend that you copy (or use as refererence) and use the source.

## View

- Common
  - [TextEdit](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/View/TextEdit.swift) (add placeholder to [TextEditor](https://developer.apple.com/documentation/swiftui/texteditor))
  - [WebView](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/View/WebView.swift) (bridge to [WKWebView](https://developer.apple.com/documentation/webkit/wkwebview))
- AppKit
  - [WindowController](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/View/AppKit/WindowController.swift) (bridge to [NSWindowController](https://developer.apple.com/documentation/appkit/nswindowcontroller))
- UIKit
  - [ActivityView](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/View/UIKit/ActivityView.swift) (bridge to [UIActivityViewController](https://developer.apple.com/documentation/uikit/uiactivityviewcontroller))

## Modifier

- [`.enabled(_ condition: Bool)`](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Modifier/EnabledModifier.swift)
- [`.border(_ color: Color, width: CGFloat = 1, edge: Edge.Set)`](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Modifier/BorderModifier.swift) ([PR](https://github.com/YusukeHosonuma/SwiftUI-Common/pull/5))

## Protocol

- [SliderValue](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/SliderValue.swift) (e.g. for use enum in [Slider](https://developer.apple.com/documentation/swiftui/slider))

## Extension

- SwiftUI
  - [View](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/View%2B.swift)
    - `toggleSidebar()`
    - `hideKeyboard()`
    - `when(<condition>) { view in ... }`
  - [ViewModifier](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/ViewModifier%2B.swift)
    - `toggleSidebar()`
    - `hideKeyboard()`
  - [Binding](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/Binding%2B.swift)
    - `optionalBinding() -> Binding<Value?>`
    - `sliderBinding() -> Binding<Double> where Value: SliderValue`
- AppKit
  - [NSApplication](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/AppKit/NSApplication%2B.swift)
    - `toggleSidebar()`
- UIKit
  - [UIApplication](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/UIKit/UIApplication%2B.swift)
    - `hideKeyboard()`
- Foundation
  - [Task](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/Task%2B.swift)
    - `sleep(seconds: UInt64) async throws`
    - `sleep(milliseconds: UInt64) async throws`

## Install

If you want.

```swift
let package = Package(
    dependencies: [
        .package(url: "https://github.com/YusukeHosonuma/SwiftUI-Common.git", from: "0.3.0"),
    ],
    targets: [
        .target(name: "<your-target-name>", dependencies: [
             .product(name: "SwiftUICommon", package: "SwiftUI-Common"),
        ]),
    ]
)
```


## Links

- This library is used in the following:
  - [Swift-Evolution-Browser](https://github.com/YusukeHosonuma/Swift-Evolution-Browser) 
  - [E2DC](https://github.com/YusukeHosonuma/E2DC)
- Document (Japanese):
  - [Effective SwiftUI 候補（仮説）](https://github.com/YusukeHosonuma/Effective-SwiftUI)

## Author

Yusuke Hosonuma / [@tobi462](https://twitter.com/tobi462)
