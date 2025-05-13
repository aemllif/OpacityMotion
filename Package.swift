// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpacityMotion",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "OpacityMotion",
            targets: ["OpacityMotion"]
        )
    ],
    targets: [
        .target(
            name: "OpacityMotion",
            dependencies: []
        )
    ]
)
