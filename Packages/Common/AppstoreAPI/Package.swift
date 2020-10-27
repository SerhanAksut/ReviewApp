// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "AppstoreAPI",
    products: [
        .library(
            name: "AppstoreAPI",
            targets: ["AppstoreAPI"]
        ),
        .library(
            name: "AppstoreAPILive",
            targets: ["AppstoreAPILive"]
        ),
    ],
    dependencies: [
        .package(path: "NetworkCore"),
        .package(path: "Entities")
    ],
    targets: [
        .target(
            name: "AppstoreAPI",
            dependencies: [
                "Entities"
            ]
        ),
        .target(
            name: "AppstoreAPILive",
            dependencies: [
                "AppstoreAPI",
                "NetworkCore"
            ]
        ),
    ]
)
