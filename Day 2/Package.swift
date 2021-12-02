// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Day 2",
    dependencies: [],
    targets: [
        .target(
            name: "Challenge",
            dependencies: ["Utilities"]
        ),
        .target(
            name: "Utilities",
            dependencies: []
        ),
        .testTarget(
            name: "ChallengeTests",
            dependencies: ["Challenge"]
        ),
        .testTarget(
            name: "UtilitiesTests",
            dependencies: ["Utilities"]
        )
    ]
)
