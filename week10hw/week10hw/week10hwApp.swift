//
//  week10hwApp.swift
//  week10hw
//
//  Created by 이재용 on 6/20/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct week10hwApp: App {
    init() {
            // Kakao SDK 초기화
            KakaoSDK.initSDK(appKey: "768d9c4c82cd61674d837f10b98ed25b")
        
        }
    var body: some Scene {
           WindowGroup {
               // onOpenURL()을 사용해 커스텀 URL 스킴 처리
               ContentView().onOpenURL(perform: { url in
                   if (AuthApi.isKakaoTalkLoginUrl(url)) {
                       AuthController.handleOpenUrl(url: url)
                   }
               })
           }
    }
}
