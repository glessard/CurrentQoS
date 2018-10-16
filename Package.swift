// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if !swift(>=4.2)
let versions = [4]
#else
let versions = [SwiftVersion.v4, .v4_2]
#endif

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
  swiftLanguageVersions: versions
)
