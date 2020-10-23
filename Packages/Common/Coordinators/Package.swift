// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Coordinators",
    products: [
        .library(
            name: "Coordinators",
            targets: ["Coordinators"]),
    ],
    targets: [
        .target(
            name: "Coordinators"
        )
    ]
)
