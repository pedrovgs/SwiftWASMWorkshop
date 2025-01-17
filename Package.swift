// swift-tools-version: 5.9.1
import PackageDescription

let package = Package(
    name: "SwiftWASMWorkshop",
    products: [
        .library(name: "SwiftWASMWorkshop", targets: ["SwiftWASMWorkshop"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftwasm/carton", from: "1.0.0")
    ],
    targets: [
        .executableTarget(name: "SwiftWASMWorkshopApp"),
        .target(name: "SwiftWASMWorkshop", dependencies: []),
        .testTarget(name: "SwiftWASMWorkshopTests")
    ]
)
