// swift-tools-version:5.9
import PackageDescription

// 배포 레포용 manifest — build-xcframework.sh 가 단일 NestAdsSDK_KMP.xcframework 를
// GitHub Release 에 올린 뒤, 릴리즈 스텝이 레포·버전·checksum 플레이스홀더를 치환해
// 채널별 배포 레포에 태그로 push 한다 (설계문서 §3.5).
// ⚠️ 이 주석에 플레이스홀더 토큰(언더스코어 2개로 감싼 형태)을 적지 않는다 — sed 가 여기도
//    치환해 배포본 주석에 값이 박힌다 (실측). 치환 대상은 아래 binaryTarget 의 url·checksum 뿐.
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
            url: "https://github.com/wisebirds/nestads-ios-sdk-kmp-dev/releases/download/3.0.1/NestAdsSDK_KMP.xcframework.zip",
            checksum: "9328520be996983b28228f39df3fe35b46103bebb8a357afb1fd7c6c23ef61f1"
        ),
    ]
)
