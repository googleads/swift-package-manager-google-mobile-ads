// swift-tools-version:5.3

// Copyright 2021 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "GoogleMobileAds",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "GoogleMobileAds",
      targets: ["GoogleMobileAdsTarget"]
    )
  ],
  dependencies: [
    .package(
      name: "GoogleUserMessagingPlatform",
      url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git",
      "1.1.0"..<"4.0.0"
    )
  ],
  targets: [
    .target(
      name: "GoogleMobileAdsTarget",
      dependencies: [
        .target(name: "GoogleMobileAds"),
        .product(name: "GoogleUserMessagingPlatform", package: "GoogleUserMessagingPlatform"),
      ],
      path: "GoogleMobileAdsTarget",
      // System frameworks and libraries required by GoogleMobileAds. Explicitly declared here to
      // support users with Clang modules disabled (e.g., Unity-exported Xcode projects), where
      // module map autolinking does not apply.
      linkerSettings: [
        .linkedLibrary("sqlite3"),
        .linkedLibrary("z"),
        .linkedFramework("AdSupport"),
        .linkedFramework("AudioToolbox"),
        .linkedFramework("AVFoundation"),
        .linkedFramework("CFNetwork"),
        .linkedFramework("CoreGraphics"),
        .linkedFramework("CoreMedia"),
        .linkedFramework("CoreTelephony"),
        .linkedFramework("CoreVideo"),
        .linkedFramework("Foundation"),
        .linkedFramework("JavaScriptCore"),
        .linkedFramework("MarketplaceKit"),
        .linkedFramework("MediaPlayer"),
        .linkedFramework("MessageUI"),
        .linkedFramework("MobileCoreServices"),
        .linkedFramework("Network"),
        .linkedFramework("QuartzCore"),
        .linkedFramework("SafariServices"),
        .linkedFramework("Security"),
        .linkedFramework("StoreKit"),
        .linkedFramework("SystemConfiguration"),
        .linkedFramework("UIKit"),
        .linkedFramework("WebKit"),
      ]
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url:
        "https://dl.google.com/googleadmobadssdk/6b8bfa69d6b4b848/googlemobileadsios-spm-13.12.0.zip",
      checksum: "6b8bfa69d6b4b8484328803fc5f71d5735caf7ce01acff8abb76e8b73c83e005"
    ),
  ]
)
