// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Presenting",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "Presenting",
            targets: ["Presenting"]),
    ],
    targets: [
        .target(
            name: "Presenting"),
        .testTarget(
            name: "PresentingTests",
            dependencies: ["Presenting"]),
    ]
)
