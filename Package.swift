// swift-tools-version: 5.10

import PackageDescription

let baseURL = "https://github.com/adison-ads/cookie-oven-series"
let artifactVer = "3.8.8"
let checksum = "ffb3e9ced2726a5218e42784b3537e9493717103caec52581dac9427b83addc9"

let package = Package(
    name: "CookieOvenSeries",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "CookieOvenSeries",
            targets: ["BinaryWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/adison-ads/adison-offerwall-ios-sdk", exact: "4.8.6"),
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
