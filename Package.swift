// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SwiftWASMWorkshop",
    dependencies: [
        .package(url: "https://github.com/swiftwasm/carton", from: "1.0.0")
    ],
    targets: [
        .executableTarget(name: "SwiftWASMWorkshop")
    ]
)
