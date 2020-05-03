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
        .package(url: "https://github.com/nsomar/Guaka.git", from: "0.4.1")
    ],
    targets: [
        .target(
            name: "AoideITunes",
            dependencies: ["AoideITunesLib", "Guaka"],
            path: "AoideITunes/Sources"
        ),
        .target(
            name: "AoideITunesLib",
            dependencies: ["AoideModel", "ITunesModel", "Mappings"],
            path: "AoideITunesLib/Sources"
        ),
        .target(
            name: "ITunesLibraryExporter",
            dependencies: ["ITunesModelStubs"],
            path: "ITunesLibraryExporter/Sources"
        ),
        .target(
            name: "AoideClient",
            dependencies: [],
            path: "AoideClient/Sources"
        ),
        .target(
            name: "Mappings",
            dependencies: ["AoideModel", "ITunesModel"],
            path: "Mappings/Sources"
        ),
        .target(
            name: "AoideModel",
            dependencies: [],
            path: "AoideModel/Sources"
        ),
        .target(
            name: "ITunesModel",
            dependencies: [],
            path: "ITunesModel/Sources"
        ),
        .target(
            name: "ITunesModelStubs",
            dependencies: ["ITunesModel"],
            path: "ITunesModelStubs/Sources"
        ),
        .testTarget(
            name: "MappingsTests",
            dependencies: ["Mappings", "ITunesModelStubs"],
            path: "Mappings/Tests"
        ),
        .testTarget(
            name: "AoideITunesLibTests",
            dependencies: ["AoideITunesLib"],
            path: "AoideITunesLib/Tests"
        )
    ]
)
