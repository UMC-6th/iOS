//
//  KakaoOauthViewModel.swift
//  Week10
//
//  Created by 김승원 on 6/11/24.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser

class kakaoAuthViewModel: ObservableObject{
    
    @Published var isLoggedIn: Bool = false
    
    @MainActor
    func kakaoLogout() {
        Task {
            if await handleKakaoLogout() {
                isLoggedIn = false
            }
        }
    }
    
    @MainActor
    func handleKakaoLogout() async -> Bool {
        
        await withCheckedContinuation { continuation in
            UserApi.shared.logout {(error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("logout() success.")
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    @MainActor
    func handleLoginWithKakaoTalkApp() async -> Bool {
        
        await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    //do something
                    _ = oauthToken
                    continuation.resume(returning: true)
                }
            }
        }

    }
    
    @MainActor
    func handelLoginWithKakaoAccount() async -> Bool {
        await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    
                    //do something
                    _ = oauthToken
                    continuation.resume(returning: true)
                }
            }
        }
        
    }
    
    @MainActor
    func handleKakaoLogin() {
        Task {
            // 카카오톡 실행 가능 여부 확인
            // 카카오톡 설치 o
            if (UserApi.isKakaoTalkLoginAvailable()) {
                isLoggedIn = await handleLoginWithKakaoTalkApp()
                // 카카오톡 설치 x
            } else {
                // 웹뷰로 열어서 카카오 계정으로 로그인
                isLoggedIn = await handelLoginWithKakaoAccount()
            }
        }
    }
    
}
