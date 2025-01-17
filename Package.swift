// swift-tools-version: 5.9.2
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
