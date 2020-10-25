// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "FilterOptions",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "FilterOptions",
            targets: ["FilterOptions"]),
    ],
    dependencies: [
        .package(path: "UIKitHelper"),
        .package(path: "UIKitPreview")
    ],
    targets: [
        .target(
            name: "FilterOptions",
            dependencies: [
                "UIKitHelper",
                "UIKitPreview"
            ]
        ),
        .testTarget(
            name: "FilterOptionsTests",
            dependencies: ["FilterOptions"]),
    ]
)
