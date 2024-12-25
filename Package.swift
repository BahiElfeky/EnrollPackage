// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EnrollPackage",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "EnrollPackage",
            targets: ["EnrollPackage"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/innovatrics/dot-ios-sdk-spm",
            exact: "7.5.1"
        )
    ],
    targets: [
        .binaryTarget(
            name: "EnrollFramework",
            path: "artifacts/EnrollFramework.xcframework"
        ),
        .target(
            name: "EnrollPackage",
            dependencies: [
                "EnrollFramework",
                // Include all products from dot-ios-sdk-spm
                .product(name: "DotDocument", package: "dot-ios-sdk-spm"),
                .product(name: "DotFaceVerification", package: "dot-ios-sdk-spm"),
                .product(name: "DotFaceExpressionNeutral", package: "dot-ios-sdk-spm"),
                .product(name: "DotFaceDetectionFast", package: "dot-ios-sdk-spm")
            ],
            path: "Sources/EnrollPackage"
        ),
        .testTarget(
            name: "EnrollPackageTests",
            dependencies: ["EnrollPackage"]
        )
    ]
)
