// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EnrollPackage",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Make EnrollFramework directly available as a product
        .library(
            name: "EnrollFramework",
            targets: ["EnrollFramework"]
        ),
        // Optionally, also expose the wrapper if needed
        .library(
            name: "EnrollPackage",
            targets: ["EnrollPackage"]
        )
    ],
    dependencies: [
        // Dependency on dot-ios-sdk-spm
        .package(
            url: "https://github.com/innovatrics/dot-ios-sdk-spm",
            exact: "7.5.1"
        )
    ],
    targets: [
        // Binary target for EnrollFramework
        .binaryTarget(
            name: "EnrollFramework",
            path: "artifacts/EnrollFramework.xcframework"
        ),
        // Optional: Wrapper target for additional functionality
        .target(
            name: "EnrollPackage",
            dependencies: [
                "EnrollFramework",
                .product(name: "DotDocument", package: "dot-ios-sdk-spm"),
                .product(name: "DotFaceVerification", package: "dot-ios-sdk-spm")
            ],
            path: "Sources/EnrollPackage"
        ),
        .testTarget(
            name: "EnrollPackageTests",
            dependencies: ["EnrollPackage"]
        )
    ]
)

