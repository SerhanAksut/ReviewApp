// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ReviewList",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "ReviewList",
            targets: ["ReviewList"]),
    ],
    dependencies: [
        .package(path: "AppstoreAPI"),
        .package(path: "Coordinators"),
        .package(path: "UIKitHelper")
    ],
    targets: [
        .target(
            name: "ReviewList",
            dependencies: [
                "AppstoreAPI",
                "Coordinators",
                "UIKitHelper"
            ]),
        .testTarget(
            name: "ReviewListTests",
            dependencies: ["ReviewList"]),
    ]
)
