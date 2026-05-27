// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "RSEmailFeedback",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "RSEmailFeedback", targets: ["RSEmailFeedback"])
    ],
    targets: [
        .target(
            name: "RSEmailFeedback",
            path: "Pod/Classes",
            publicHeadersPath: "."
        )
    ]
)
