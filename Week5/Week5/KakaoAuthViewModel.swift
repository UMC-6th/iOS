//
//  KakaoAuthViewModel.swift
//  Week5
//
//  Created by 김승원 on 5/8/24.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser

class KakaoAuthViewModel: ObservableObject {
    
    var subscriptions = Set<AnyCancellable>()
    
    @Published var isLoggedIn: Bool = false
    
    init() {
        print("kakaoAuthViewModel - init() called")
    }
    /* async */
    // 카톡 앱으로 로그인 인증
    func kakaoLoginWithApp() async -> Bool {
        
        await withCheckedContinuation{ continuation in
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
    
    // 카톡 계정으로 로그인 인증
    func kakaoLoginWithAccount() async -> Bool {
        
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
    
    // 메인 스레드에서 작동되게 하는 거
    @MainActor
    func kakaoLogin() {
        print("KakaoAuthViewModel - handleKakaoLogin() called")
        
        Task {
            // 카카오톡 실행 가능 여부 확인
            if (UserApi.isKakaoTalkLoginAvailable()) {
                // 카톡 앱으로 인증
                isLoggedIn = await kakaoLoginWithApp()

            } else { // 카톡 설치 x인 경우
                // 카톡 계정으로 로그인 (웹뷰)
                isLoggedIn = await kakaoLoginWithAccount()

            }
        }
    } // 로그인
    
    @MainActor
    func kakaoLogout() {
        Task {
            if await handleKakaoLogout() {
                self.isLoggedIn = false
            }
        }
    }
    
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
    
    
}
 
