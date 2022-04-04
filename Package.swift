// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUI-Common",
    products: [
        .library(name: "SwiftUI-Common", targets: ["SwiftUI-Common"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "SwiftUI-Common", dependencies: []),
        .testTarget(name: "SwiftUI-CommonTests", dependencies: ["SwiftUI-Common"]),
    ]
)
