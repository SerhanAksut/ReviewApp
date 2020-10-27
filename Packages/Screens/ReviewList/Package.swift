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
        .package(path: "UIKitPreview"),
        .package(path: "SwiftKit"),
        .package(path: "Entities")
    ],
    targets: [
        .target(
            name: "ReviewList",
            dependencies: [
                "AppstoreAPI",
                "Coordinators",
                "UIKitHelper",
                "UIKitPreview",
                "SwiftKit",
                "Entities"
            ]),
        .testTarget(
            name: "ReviewListTests",
            dependencies: ["ReviewList"]),
    ]
)
