// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TabBarUIAction",
    platforms: [
        .iOS(.v14)
    ],
    products: [.library(name: "TabBarUIAction", targets: ["TabBarUIAction"])],
    dependencies: [],
    targets: [.target(name: "TabBarUIAction", dependencies: [], path: "./Source")],
    swiftLanguageVersions: [.v5]
)
