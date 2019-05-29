// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "CurrentQoS",
  products: [
    .library(name: "CurrentQoS", targets: ["CurrentQoS"]),
  ],
  dependencies: [],
  targets: [
    .target(name: "CurrentQoS", dependencies: []),
    .testTarget(name: "CurrentQoSTests", dependencies: ["CurrentQoS"]),
  ],
  swiftLanguageVersions: [.v4_2, .version("5")]
)
