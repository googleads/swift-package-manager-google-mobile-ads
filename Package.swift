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
      path: "GoogleMobileAdsTarget"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url:
        "https://dl.google.com/googleadmobadssdk/04a18e81adabfc08/googlemobileadsios-spm-13.10.0.zip",
      checksum: "04a18e81adabfc087b228e962248ec6acb925f0209c76c4bdf80739590d5321c"
    ),
  ]
)
