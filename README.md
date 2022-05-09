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
<summary>debug { ... }</summary>
  
```swift
func content(text: String, number: Int) -> some View {
    Text("\(text), \(number)")
        .debug {
            print("text: \(text)")
            print("number: \(number)")
        }
}
```
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


## Binding extension

[Binding+.swift](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/Binding%2B.swift)<br>
[SliderValue.swift](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/SliderValue.swift) (e.g. for use `enum` in [Slider](https://developer.apple.com/documentation/swiftui/slider))

<details>
<summary>optionalBinding()</summary>

```swift
enum Menu: Int {
    case all
    case star
}

struct BindingOptionalView: View {
    @SceneStorage("selection") var selection: Menu = .all

    var body: some View {
        let optionalSelection = $selection.optionalBinding() // 💡 `Binding<Menu>` -> `Binding<Menu?`
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
<summary>wrappedBinding()</summary>

```swift
@Binding var optionalString: String?

var body: some View {
    if let binding = $optionalString.wrappedBinding() { // 💡 `Binding<String?>` -> `Binding<String>?`
        TextField("placeholder", text: binding)
    } else {
        Text("nil")
    }
}
```
</details>


<details>
<summary>sliderBinding()</summary>

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
                value: $textSize.sliderBinding(), // 💡 `Binding<TextSize>` -> `Binding<Double>`
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

## Concurrency extensions
  
[Task+.swift](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/Task%2B.swift)

```swift
Task {
    try await Task.sleep(seconds: 1)        // 1 s
    try await Task.sleep(milliseconds: 500) // 500 ms
}
```

## Other

- [NSApplication+.swift](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/AppKit/NSApplication%2B.swift)
  - `toggleSidebar()`

- [UIApplication+.swift](https://github.com/YusukeHosonuma/SwiftUI-Common/blob/main/Sources/SwiftUICommon/Extension/UIKit/UIApplication%2B.swift)
  - `hideKeyboard()`

## Install

If you want.

```swift
let package = Package(
    dependencies: [
        .package(url: "https://github.com/YusukeHosonuma/SwiftUI-Common.git", branch: "main"),
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
