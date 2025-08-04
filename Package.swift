// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AttributedStringExtension",
    platforms: [
        .macOS(.v12), .iOS(.v15), .tvOS(.v15), .watchOS(.v8), .visionOS(.v1)
    ],
    products: [
        .library(
            name: "AttributedStringExtension",
            targets: ["AttributedStringExtension"]),
    ],
    targets: [
        .target(
            name: "AttributedStringExtension"),
        .testTarget(
            name: "AttributedStringExtensionTests",
            dependencies: ["AttributedStringExtension"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
