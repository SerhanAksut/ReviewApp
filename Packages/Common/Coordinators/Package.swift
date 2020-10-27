// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Coordinators",
    products: [
        .library(
            name: "Coordinators",
            targets: ["Coordinators"]),
    ],
    dependencies: [
        .package(path: "Entities")
    ],
    targets: [
        .target(
            name: "Coordinators",
            dependencies: [
                "Entities"
            ]
        )
    ]
)
