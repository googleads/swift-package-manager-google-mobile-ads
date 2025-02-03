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
  platforms: [.iOS(.v12)],
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
      "1.1.0"..<"3.0.0"
    )
  ],
  targets: [
    .target(
      name: "GoogleMobileAdsTarget",
      dependencies: [
        .target(name: "GoogleMobileAds"),
        .product(name: "GoogleUserMessagingPlatform", package: "GoogleUserMessagingPlatform"),
      ],
      path: "GoogleMobileAdsTarget"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url:
        "https://dl.google.com/googleadmobadssdk/7d871ca8f8163d23/googlemobileadsios-spm-12.0.0.zip",
      checksum: "7d871ca8f8163d236caf5c6d4a4b4e4dbf1c69f2e0d3f2bfaf0744b621e78ed8"
    ),
  ]
)
