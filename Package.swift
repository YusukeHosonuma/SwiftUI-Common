// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUICommon",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
    ],
    products: [
        .library(name: "SwiftUICommon", targets: ["SwiftUICommon"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "SwiftUICommon", dependencies: []),
    ]
)
