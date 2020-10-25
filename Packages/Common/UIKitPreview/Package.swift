// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "UIKitPreview",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "UIKitPreview",
            targets: ["UIKitPreview"]),
    ],
    targets: [
        .target(
            name: "UIKitPreview",
            dependencies: []),
    ]
)
