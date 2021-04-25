// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "EasyThemer",
    platforms: [.iOS(.v9)],
    products: [
        .library(
            name: "EasyThemer",
            targets: ["EasyThemer"]),
    ],
    targets: [
        .target(
            name: "EasyThemer",
            path: "EasyThemer/Classes"),
    ]
)
