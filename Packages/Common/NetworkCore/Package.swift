// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "NetworkCore",
    products: [
        .library(
            name: "NetworkCore",
            targets: ["NetworkCore"]),
    ],
    targets: [
        .target(
            name: "NetworkCore"
        ),
    ]
)
