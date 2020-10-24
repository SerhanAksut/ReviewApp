// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ReviewList",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ReviewList",
            targets: ["ReviewList"]),
    ],
    dependencies: [
        .package(path: "AppstoreAPI"),
        .package(path: "Coordinators"),
        .package(path: "UIKitHelper"),
        .package(path: "UIKitPreview")
    ],
    targets: [
        .target(
            name: "ReviewList",
            dependencies: [
                "AppstoreAPI",
                "Coordinators",
                "UIKitHelper",
                "UIKitPreview"
            ]),
        .testTarget(
            name: "ReviewListTests",
            dependencies: ["ReviewList"]),
    ]
)
