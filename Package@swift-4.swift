// swift-tools-version:4.0
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
  swiftLanguageVersions: [4,5]
)
