// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "aoide-iTunes",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "aoideiTunes", targets: ["aoide-iTunes"])
    ],
    dependencies: [
        .package(url: "https://github.com/nsomar/Guaka.git", from: "0.4.1")
    ],
    targets: [
        .target(
            name: "aoide-iTunes",
            dependencies: ["aoide-iTuneslib", "Guaka"],
            path: "aoide-iTunes/Sources"
        ),
        .target(
            name: "aoide-iTuneslib",
            dependencies: [],
            path: "aoide-iTuneslib/Sources"
        ),
        .testTarget(
            name: "aoide-iTunesTests",
            dependencies: ["aoide-iTuneslib"],
            path: "aoide-iTuneslib/Tests"
        )
    ]
)
