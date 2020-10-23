// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIKitHelper",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "UIKitHelper",
            targets: ["UIKitHelper"]),
    ],
    targets: [
        .target(
            name: "UIKitHelper",
            dependencies: []),
    ]
)
