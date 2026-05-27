// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "RSEmailFeedback",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "RSEmailFeedback", targets: ["RSEmailFeedback"])
    ],
    dependencies: [
        .package(url: "https://github.com/lmirosevic/GBDeviceInfo", from: "7.5.0")
    ],
    targets: [
        .target(
            name: "RSEmailFeedback",
            dependencies: ["GBDeviceInfo"],
            path: "Pod/Classes",
            publicHeadersPath: "."
        )
    ]
)
