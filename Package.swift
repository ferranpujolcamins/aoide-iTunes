// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "aoide-iTunes",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "aoideITunes", targets: ["AoideITunes"]),
        .executable(name: "iTunesLibraryExporter", targets: ["ITunesLibraryExporter"])
    ],
    dependencies: [
        .package(url: "https://github.com/nsomar/Guaka.git", from: "0.4.1"),
        .package(name: "Bow", url: "https://github.com/bow-swift/bow.git", from: "0.8.0")
    ],
    targets: [
        .target(
            name: "AoideITunes",
            dependencies: ["AoideITunesLib", "Guaka"],
            path: "AoideITunes"
        ),
        .target(
            name: "AoideITunesLib",
            dependencies: [
                "AoideModel",
                "ITunesModel",
                "Mappings",
                "AoideClient",
                "Bow",
                .product(name: "BowEffects", package: "Bow")
            ],
            path: "AoideITunesLib"
        ),
        .target(
            name: "ITunesLibraryExporter",
            dependencies: ["ITunesModelStubs"],
            path: "ITunesLibraryExporter"
        ),
        .target(
            name: "AoideClient",
            dependencies: [
                "AoideModel",
                "Bow",
                .product(name: "BowEffects", package: "Bow")
            ],
            path: "AoideClient"
        ),
        .target(
            name: "Mappings",
            dependencies: ["AoideModel", "ITunesModel"],
            path: "Mappings"
        ),
        .target(
            name: "AoideModel",
            dependencies: [],
            path: "AoideModel"
        ),
        .target(
            name: "ITunesModel",
            dependencies: [],
            path: "ITunesModel"
        ),
        .target(
            name: "ITunesModelStubs",
            dependencies: ["ITunesModel"],
            path: "ITunesModelStubs"
        ),
        .testTarget(
            name: "MappingsTests",
            dependencies: ["Mappings", "ITunesModelStubs"],
            path: "MappingTests"
        ),
        .testTarget(
            name: "IntegrationTests",
            dependencies: [
                "AoideITunesLib",
                "AoideClient",
                "AoideModel",
                "ITunesModelStubs",
                "Bow",
                .product(name: "BowEffects", package: "Bow")
            ],
            path: "IntegrationTests"
        )
    ]
)
