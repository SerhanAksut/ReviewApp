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
        .package(path: "AppstoreAPI")
    ],
    targets: [
        .target(
            name: "ReviewList",
            dependencies: [
                "AppstoreAPI"
            ]),
        .testTarget(
            name: "ReviewListTests",
            dependencies: ["ReviewList"]),
    ]
)
