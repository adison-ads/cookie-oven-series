// swift-tools-version: 5.10

import PackageDescription

let baseURL = "https://github.com/adison-ads/cookie-oven-series"
let artifactVer = "3.7.6"
let checksum = "bf201750548d67d17d09f4e17bbb0eb42d7e42e460d46af2ceb47ad322e08bad"

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
