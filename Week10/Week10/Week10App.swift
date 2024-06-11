//
//  Week10App.swift
//  Week10
//
//  Created by 김승원 on 6/11/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct Week10App: App {
    
    @UIApplicationDelegateAdaptor var appDelegate : MyAppDelegate
    
    init() {
//        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
//        // Kakao SDK 초기화
//        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
