# SwiftUI-Common

SwiftUI components that seem to be highly reusable.

Since this is an **experimental library**,, we recommend that you copy (or use as refererence) and use the source.

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
