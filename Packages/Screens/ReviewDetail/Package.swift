// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ReviewDetail",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ReviewDetail",
            targets: ["ReviewDetail"]),
    ],
    dependencies: [
        .package(path: "UIKitPreview"),
        .package(path: "UIKitHelper"),
        .package(path: "SwiftKit"),
        .package(path: "Entities")
    ],
    targets: [
        .target(
            name: "ReviewDetail",
            dependencies: [
                "UIKitPreview",
                "UIKitHelper",
                "SwiftKit",
                "Entities"
            ]
        ),
        .testTarget(
            name: "ReviewDetailTests",
            dependencies: ["ReviewDetail"]),
    ]
)
