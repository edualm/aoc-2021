// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Day 9",
    dependencies: [
        .package(path: "../Utilities")
    ],
    targets: [
        .target(
            name: "Main",
            dependencies: ["Challenge"]
        ),
        .target(
            name: "Challenge",
            dependencies: ["Utilities"]
        ),
        .testTarget(
            name: "ChallengeTests",
            dependencies: ["Challenge"]
        )
    ]
)
