// swift-tools-version:5.9
import PackageDescription

// 배포 레포용 manifest — build-xcframework.sh 가 단일 NestAdsSDK_KMP.xcframework 를
// GitHub Release 에 올린 뒤, 릴리즈 스텝이 nestads-ios-sdk-kmp-dev·1.0.0·b6050f8929a683ebd37fd99b9a759ba262654abe1d7c3eeb82a5a61059114d8f 을 치환해
// 채널별 배포 레포에 태그로 push 한다 (설계문서 §3.5).
//
// 전체(Shared + Swift 소스)가 한 바이너리로 말려 있어 source target 이 없다 —
// 매체사·메인 SDK 는 binaryTarget 하나만 resolve 한다 (소스 비공개).
//
// product 이름 NestAdsSDK_KMP 는 메인 SDK 가 로컬 패키지에서 쓰는 이름과 같아야 한다
// (pbxproj product 의존성 이름이 그대로 이어지게 — §3.5).
let package = Package(
    name: "NestAdsSDK_KMP",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(name: "NestAdsSDK_KMP", targets: ["NestAdsSDK_KMP"]),
    ],
    targets: [
        .binaryTarget(
            name: "NestAdsSDK_KMP",
            url: "https://github.com/wisebirds/nestads-ios-sdk-kmp-dev/releases/download/1.0.0/NestAdsSDK_KMP.xcframework.zip",
            checksum: "b6050f8929a683ebd37fd99b9a759ba262654abe1d7c3eeb82a5a61059114d8f"
        ),
    ]
)
