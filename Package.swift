// swift-tools-version: 5.10

import PackageDescription

let baseURL = "https://github.com/adison-ads/cookie-oven-series"
let artifactVer = "3.7.0"
let checksum = "2341873503h4o13hrfp9huf9"

let package = Package(
    name: "CookieOvenSeries",
    products: [
        .library(
            name: "CookieOvenSeries",
            targets: ["CookieOvenSeries", "_CookieOvenSeriesTarget"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/adison-ads/adison-offerwall-ios-sdk", exact: "4.6.0"),
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.0.0"),
    ],
    targets: [
        .binaryTarget(
            name: "CookieOvenSeries",
            url: "\(baseURL)/releases/download/\(artifactVer)/CookieOvenSeries.zip",
            checksum: checksum
        ),
        .target(
            name: "_CookieOvenSeriesTarget",
            dependencies: [
                .product(name: "AdisonOfferwallSDK", package: "adison-offerwall-ios-sdk"),
                .product(name: "Lottie", package: "lottie-spm"),
            ],
            path: "Sources/_Stub"
        ),
    ]
)
