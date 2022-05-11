// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUI-Common",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
    ],
    products: [
        .library(name: "SwiftUICommon", targets: ["SwiftUICommon"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-case-paths.git", from: "0.8.0"),
    ],
    targets: [
        .target(name: "SwiftUICommon", dependencies: [
            .product(name: "CasePaths", package: "swift-case-paths"),
        ]),
    ]
)
