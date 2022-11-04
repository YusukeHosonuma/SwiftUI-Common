[![Build](https://github.com/YusukeHosonuma/SwiftUI-Common/actions/workflows/main.yml/badge.svg)](https://github.com/YusukeHosonuma/SwiftUI-Common/actions/workflows/main.yml)
![iOS 14+](https://img.shields.io/badge/iOS-14+-4BC51D.svg?style=flat)
[![Twitter](https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Ftwitter.com%2Ftobi462)](https://twitter.com/tobi462)

# SwiftUI-Common

SwiftUI components and extensions that seem to be highly reusable.

Since this is an **experimental library**, we recommend that you copy (or use as refererence) and use the source.

## Control

<details>
<summary>TextEdit</summary>

[TextEdit.swift](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/View/TextEdit.swift) (add placeholder to [TextEditor](https://developer.apple.com/documentation/swiftui/texteditor))

```swift
TextEdit("Please paste.", text: $text, font: .custom("SF Mono", size: 16))
```
</details>


<details>
<summary>ResizableImage</summary>

[ResizableImage](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/View/ResizableImage.swift)
    
The [Image](https://developer.apple.com/documentation/swiftui/image) that is resized only if it extends beyond the area.

```swift

Group {
    ResizableImage(systemName: "swift", contentMode: .fit)
    ResizableImage("island", contentMode: .fit)
    ResizableImage("island", contentMode: .fill)
}
.frame(width: 140, height: 140)
.border(.red)
```
    
<img width="317" src="https://user-images.githubusercontent.com/2990285/168200204-dc465a71-c3f1-4b92-98f8-8353f3c8ad46.png">
</details>


<details>
<summary>WebView</summary>

[WebView.swift](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/View/WebView.swift) (bridge to [WKWebView](https://developer.apple.com/documentation/webkit/wkwebview))

```swift
@StateObject var webViewState = WebViewState { _ in
    // 💡 If you want to more configuration
    // webView.allowsBackForwardNavigationGestures = true
}

var body: some View {
    ZStack {
        WebView(url: url, state: webViewState)

        if webViewState.isFirstLoading {
            ProgressView()
        }

        // 💡 Note: If you want to display an indicator at each page transition.
        // if webViewState.isLoading {
        //     ProgressView()
        // }
    }
    .toolbar {
        ToolbarItemGroup(placement: .bottomBar) {
            Spacer()

            // ✅ Back
            Button {
                webViewState.goBack()
            } label: {
                Image(systemName: "chevron.backward")
            }
            .enabled(webViewState.canGoBack)

            // ✅ Forward
            Button {
                webViewState.goForward()
            } label: {
                Image(systemName: "chevron.forward")
            }
            .enabled(webViewState.canGoForward)
        }
    }
}
```

<img width="339" alt="image" src="https://user-images.githubusercontent.com/2990285/167335179-0e42798b-fd4c-4844-8eca-c5cb3e6ab666.png">
</details>


<details>
<summary>ActivityView</summary>

[ActivityView](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/View/UIKit/ActivityView.swift) (bridge to [UIActivityViewController](https://developer.apple.com/documentation/uikit/uiactivityviewcontroller))

```swift
@State static var isPresent = false

static var previews: some View {
    Image(systemName: "square.and.arrow.up")
        .sheet(isPresented: .constant(true)) {
            ActivityView(activityItems: [URL(string: "https://github.com/YusukeHosonuma/SwiftUI-Common")!])
        }
}
```
</details>


<details>
<summary>WindowController</summary>

[WindowController](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/View/AppKit/WindowController.swift) (bridge to [NSWindowController](https://developer.apple.com/documentation/appkit/nswindowcontroller))<br>
T.B.D
</details>

## View extensions

[View+.swift](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/View%2B.swift)

<details>
<summary>enabled()</summary>
  
```swift
@State var isEnabled = false

var body: some View {
    VStack {
        Button("Hello") {}
            .enabled(isEnabled) // 💡 Same as `.disabled(isEnabled == false)`
}
```
</details>


<details>
<summary>extend { ... }</summary>

```swift
Text("Hello")
    .extend { content in
        if #available(iOS 15, *) {
            content
                .environment(\.dynamicTypeSize, .xxxLarge)
        } else {
            content
        }
    }
```
</details>


<details>
<summary>when() { ... }</summary>

```swift
@State var condition = false

var body: some View {
    Text("Hello")
        .when(condition) {
            $0.underline()
        }
}
```
</details>


<details>
<summary>whenLet() { ... }</summary>

```swift
@State var textColor: Color? = .red

var body: some View {
    Text("Hello")
        .whenLet(textColor) { content, textColor in
            content
                .foregroundColor(textColor)
        }
}
```
</details>

  
<details>
<summary>border()</summary>

```swift
Text("Hello")
    .padding()
    .border(.red, edge: .vertical) // default `width` = 1
    .border(.blue, width: 8, edge: .leading)
```

<img width="166" alt="image" src="https://user-images.githubusercontent.com/2990285/167331264-ee274f67-ec58-4d79-88b9-61e2fa57d66f.png">
</details>


<details>
<summary>toggleSidebar()</summary>
  
```swift
Button("toggle") {
    toggleSidebar()
}
```
</details>


<details>
<summary>hideKeyboard()</summary>
  
```swift
Button("hide") {
    hideKeyboard()
}
```
</details>

[View+Alert.swift](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/View%2BAlert.swift)

<details>
<summary>alert(error: $error)</summary>
  
```swift
enum MyError: LocalizedError {
    case warning, fatal

    var errorDescription: String? {
        switch self {
        case .warning: return "Warning"
        case .fatal: return "Fatal"
        }
    }

    var helpMessage: String {
        switch self {
        case .warning: return "This is warning."
        case .fatal: return "This is fatal."
        }
    }
}

struct ContentView: View {
    @State var error: MyError? = nil

    var body: some View {
        VStack {
            Button("Warning") { error = .warning }
            Button("Fatal") { error = .fatal }
        }
        //
        // iOS 15+
        //
        .alert(error: $error) {}     // ✅ Not need to specify `isPresented: Binding<Bool>`.
        .alert(error: $error) { _ in // 💡 You can specify message.
            Button("OK") {}
        } message: { error in
            Text(error.helpMessage)
        }
        //
        // iOS 14+
        //
        .alert(error: $error)
        .alert(
            error: $error,
            message: Text(error?.helpMessage ?? "unknown"),
            dismissButton: .cancel() // Optional
        )
    }
}
```
</details>


[View+Debug.swift](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/View%2BDebug.swift)

<details>
<summary>debug { ... }</summary>
  
```swift
func content(number: Int) -> some View {
    Text("\(number)")
        .debug {
            print("number: \(number)") // 💡 Any debug code.
        }
}
```
</details>

<details>
<summary>print()</summary>

```swift
func content(number: Int) -> some View {
    Text("\(number)")
        .print("number: \(number)") // 💡
}
```
</details>

<details>
<summary>printOnChange()</summary>

```swift
@State var number: Int = 42

var body: some View {
    Text("\(number)")
        .printOnChange("number: ") { number } // 💡 Print "number: 42" when `number is changed.
}
```
</details>


## Binding extension

[Binding+.swift](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/Binding%2B.swift)<br>
[SliderValue.swift](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/SliderValue.swift) (e.g. for use `enum` in [Slider](https://developer.apple.com/documentation/swiftui/slider))

<details>
<summary>map()</summary>
    
```swift
@State var boolString = "false"

var body: some View {
    VStack {
        TextField("isOn", text: $boolString)
            .textFieldStyle(.roundedBorder)
            .autocapitalization(.none)

        //
        // 💡 Can edit `String` as `Bool`.
        //
        Toggle("isOn", isOn: $boolString.map( // ✅ `Binding<String>` -> `Binding<Bool>`
            get: { $0 == "true" },
            set: { $0 ? "true" : "false" }
        ))
    }
}
```
</details>

    
<details>
<summary>inverted()</summary>
    
```swift
@State var isEnabled = false

var body: some View {
    Toggle("Disable", isOn: $isEnabled.inverted()) // ✅ `true` -> `false` and `false` -> true`
    Text("isEnabled: \(isEnabled ? "True" : "False")")
}
```
</details>

<details>
<summary>optional()</summary>

```swift
enum Menu: Int {
    case all
    case star
}

struct BindingOptionalView: View {
    @SceneStorage("selection") var selection: Menu = .all

    var body: some View {
        let optionalSelection = $selection.optional() // 💡 `Binding<Menu>` -> `Binding<Menu?`
        NavigationView {
            List {
                NavigationLink(tag: Menu.all, selection: optionalSelection, destination: { Text("1") }) {
                    Text("One")
                }
                NavigationLink(tag: Menu.star, selection: optionalSelection, destination: { Text("2") }) {
                    Text("Two")
                }
            }
        }
    }
}
```
</details>

  
<details>
<summary>wrapped()</summary>

```swift
@Binding var optionalString: String?

var body: some View {
    if let binding = $optionalString.wrapped() { // 💡 `Binding<String?>` -> `Binding<String>?`
        TextField("placeholder", text: binding)
    } else {
        Text("nil")
    }
}
```
</details>

    
<details>
<summary>case()</summary>
    
```swift
import CasePaths // ✅ Required `pointfreeco/swift-case-paths`
import SwiftUI

enum EnumValue {
    case string(String) // 💡 Has associated-type `String`
    case bool(Bool)     // 💡 Has associated-type `Bool`
}

struct CaseBindingView: View {
    @State var value: EnumValue = .string("Swift")

    var body: some View {
        VStack {
            //
            // 💡 Note: `switch` statement is only for completeness check by compiler.
            // (Removal does not affect the operation)
            //
            switch value {
            case .string:
                //
                // ✅ Binding<Value> -> Binding<String>?
                //
                if let binding = $value.case(/EnumValue.string) {
                    TextField("placeholder", text: binding)
                }

            case .bool:
                //
                // ✅ Binding<Value> -> Binding<Int>?
                //
                if let binding = $value.case(/EnumValue.bool) {
                    Toggle("isOn", isOn: binding)
                }
            }
        }
    }
}
```
</details>


<details>
<summary>slider()</summary>

```swift
// 💡 Want to edit by slider.
enum TextSize: Int, CaseIterable {
    case xSmall = 0
    case small = 1
    ...

    var name: String {
        switch self {
        case .xSmall: return "xSmall"
        case .small: return "small"
        ...
    }
}

// ✅ Implement `SliderValue` protocol.
extension TextSize: SliderValue {
    static let sliderRange: ClosedRange<Double> = 0 ... Double(TextSize.allCases.count - 1)

    var sliderIndex: Int { rawValue }

    init(fromSliderIndex index: Int) {
        self = Self(rawValue: index)!
    }
}
  
struct SliderView: View {
    @State var textSize: TextSize = .medium

    var body: some View {
        VStack {
            Text("\(textSize.name)")
            Slider(
                value: $textSize.slider(), // 💡 `Binding<TextSize>` -> `Binding<Double>`
                in: TextSize.sliderRange,
                step: 1
            )
        }
        .padding()
    }
}
```

<img width="333" alt="image" src="https://user-images.githubusercontent.com/2990285/167333536-031af3f8-86ce-46bd-81e4-6dc63f51eb2c.png">
</details>

## CGSize extensions

[CGSize+.swift](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/CGSize%2B.swift)

<details>
<summary>Comparable</summary>

```swift
let a = CGSize(width: 10, height: 20)
let b = CGSize(width: 5, height: 10)
a < b // 💡 Alias for `a.width < b.width && a.height < b.height`
```
</details>


<details>
<summary>AdditiveArithmetic</summary>

```swift
let a = CGSize(width: 10, height: 20)
let b = CGSize(width: 5, height: 10)
a + b // 💡 Alias for `CGSize(width: a.width + b.width, height: a.height + b.height)
a - b // 💡 Alias for `CGSize(width: a.width - b.width, height: a.height - b.height)
```
</details>

    
## Image extensions

[Image+.swift](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/Image%2B.swift)

<details>
<summary>init(UIImage or NSImage)</summary>

```swift
#if os(macOS)
private typealias XImage = NSImage
#else
private typealias XImage = UIImage
#endif

struct ImageView: View {
    var body: some View {
        Image(image: renderImage()) // 💡
            .resizable()
            .scaledToFit()
    }

    private func renderImage() -> XImage {
        // ⚠️ Assumes rendering code
        #if os(macOS)
        NSImage(named: "picture")!
        #else
        UIImage(named: "picture")!
        #endif
    }
}
```
</details>

    
## Compatible iOS 15+ (Can be used in iOS 14+)

[Section+iOS15.swift](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/Compatible/Section%2BiOS15.swift)<br>
[@Dismiss](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/Compatible/Dismiss.swift)

<details>
<summary>Section</summary>
    
```swift
Section("title") {
    ...
}
```
</details>
    
<details>
<summary>@Dismiss</summary>

```swift
// ✅ Compatible to `@Environment(\.dismiss) var dismiss` in iOS 15.
@Dismiss var dismiss

// 💡 in iOS 14+
// @Environment(\.presentationMode) private var presentationMode

var body: some View {
    VStack {
        Button("Close") {
            // ✅ Same as `@Environment(\.dismiss)`
            dismiss()

            // 💡 in iOS 14
            // presentationMode.wrappedValue.dismiss()
        }
    }
    .padding()
}
```
</details>


## Misc
  
[Space.swift](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/View/Space.swift.swift)

<details>
<summary>Space(...)</summary>
    
```swift
// Alias for `Spacer().frame(width: 10)`
Space(width: 10)

// Alias for `Spacer().frame(height: 10)`
Space(height: 10)
```
</details>


## Concurrency extensions
  
[Task+.swift](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/Task%2B.swift)

<details>
<summary>sleep()</summary>
    
```swift
Task {
    try await Task.sleep(seconds: 1)        // 1 s
    try await Task.sleep(milliseconds: 500) // 500 ms
}
```
</details>

    
## Install

If you want.

```swift
let package = Package(
    dependencies: [
        .package(url: "https://github.com/YusukeHosonuma/SwiftUI-Common.git", from: "1.0.0"),
    ],
    targets: [
        .target(name: "<your-target-name>", dependencies: [
             .product(name: "SwiftUICommon", package: "SwiftUI-Common"),
        ]),
    ]
)
```

## Development

Setup:

```sh
make setup
```

Format:

```sh
make format
```

## Links

- This library is used in the following:
  - [SwiftUI-Simulator](https://github.com/YusukeHosonuma/SwiftUI-Simulator)
  - [UserDefaults-Browser](https://github.com/YusukeHosonuma/UserDefaultsBrowser)
  - [Swift-Evolution-Browser](https://github.com/YusukeHosonuma/Swift-Evolution-Browser) 
  - [E2DC](https://github.com/YusukeHosonuma/E2DC)
- Document (Japanese):
  - [Effective SwiftUI 候補（仮説）](https://github.com/YusukeHosonuma/Effective-SwiftUI)

## Author

Yusuke Hosonuma / [@tobi462](https://twitter.com/tobi462)
