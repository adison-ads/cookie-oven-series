// swift-tools-version: 5.10

import PackageDescription

let baseURL = "https://github.com/adison-ads/cookie-oven-series"
let artifactVer = "3.7.4"
let checksum = "83f47374d6d8b6d2718579a55cee5d96b087cc7f97e715cf1c48bd714f636166"

let package = Package(
    name: "CookieOvenSeries",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "CookieOvenSeries",
            targets: ["BinaryWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/adison-ads/adison-offerwall-ios-sdk", exact: "4.7.4"),
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.0.0"),
    ],
    targets: [
        .binaryTarget(
            name: "CookieOvenSeries",
            url: "\(baseURL)/releases/download/\(artifactVer)/CookieOvenSeries.zip",
            checksum: checksum
        ),
        .target(
            name: "BinaryWrapper",
            dependencies: [
                "CookieOvenSeries",
                .product(name: "AdisonOfferwallSDK", package: "adison-offerwall-ios-sdk"),
                .product(name: "Lottie", package: "lottie-spm"),
            ],
            path: "Sources/_Stub"
        ),
    ]
)
