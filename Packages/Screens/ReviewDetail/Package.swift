// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

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
        .package(path: "UIKitHelper")
    ],
    targets: [
        .target(
            name: "ReviewDetail",
            dependencies: [
                "UIKitHelper"
            ]
        ),
        .testTarget(
            name: "ReviewDetailTests",
            dependencies: ["ReviewDetail"]),
    ]
)
