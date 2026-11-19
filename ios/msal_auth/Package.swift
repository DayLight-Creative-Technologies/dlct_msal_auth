// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "msal_auth",
    platforms: [
        .iOS("14.0")
    ],
    products: [
        .library(name: "msal-auth", targets: ["msal_auth"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        // The podspec's `~> 2.2.0`: MSAL 2.2.x, the version the CocoaPods build links.
        .package(
            url: "https://github.com/AzureAD/microsoft-authentication-library-for-objc",
            .upToNextMinor(from: "2.2.0")
        )
    ],
    targets: [
        .target(
            name: "msal_auth",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "MSAL", package: "microsoft-authentication-library-for-objc")
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy"),
            ]
        )
    ]
)
