// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitterOcaml",
    platforms: [.macOS(.v10_13), .iOS(.v11)],
    products: [
        .library(name: "TreeSitterOcaml", targets: ["TreeSitterOcaml"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", from: "0.7.1"),
    ],
    targets: [
        .target(
            name: "TreeSitterOcaml",
            path: ".",
            sources: [
                "interface/src/parser.c",
                "interface/src/scanner.cc",
                "ocaml/src/parser.c",
                "ocaml/src/scanner.cc",
            ],
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("ocaml/src")]
        ),
        .testTarget(
            name: "TreeSitterOCamlTests",
            dependencies: [
                "TreeSitterOcaml",
                "SwiftTreeSitter"
            ],
            path: "./bindings/swift/TreeSitterOCamlTests"
        )
    ]
)
