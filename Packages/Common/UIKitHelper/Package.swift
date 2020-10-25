// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "UIKitHelper",
    platforms: [
        .iOS(.v13)
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
