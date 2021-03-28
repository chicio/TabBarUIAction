// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TabBarUIAction",
    products: [.library(name: "TabBarUIAction", targets: ["TabBarUIAction"])],
    dependencies: [],
    targets: [.target(name: "TabBarUIAction", dependencies: [], path: "./Source")],
    platforms: [
        .iOS(.v14)
    ],
    swiftLanguageVersions: [.v5]
)
