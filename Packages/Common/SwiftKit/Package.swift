// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SwiftKit",
    products: [
        .library(
            name: "SwiftKit",
            targets: ["SwiftKit"]),
    ],
    targets: [
        .target(
            name: "SwiftKit",
            dependencies: []),
    ]
)
