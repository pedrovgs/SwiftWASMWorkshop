// swift-tools-version: 5.9.1
import PackageDescription

let package = Package(
    name: "SwiftWASMWorkshop",
    platforms: [.macOS(.v14)],
    products: [
        .library(name: "SwiftWASMWorkshop", targets: ["SwiftWASMWorkshop"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftwasm/carton", from: "1.0.0"),
        .package(url: "https://github.com/swiftwasm/JavaScriptKit", from: "0.22.2"),
    ],
    targets: [
        .executableTarget(name: "SwiftWASMWorkshopApp", dependencies: ["JavaScriptKit", "SwiftWASMWorkshop"]),
        .target(name: "SwiftWASMWorkshop", dependencies: []),
        .testTarget(name: "SwiftWASMWorkshopTests")
    ]
)
