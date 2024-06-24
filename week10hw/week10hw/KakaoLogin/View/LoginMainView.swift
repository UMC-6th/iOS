//
//  LoginMainView.swift
//  week10hw
//
//  Created by 이재용 on 6/20/24.
//
import SwiftUI
import KakaoSDKAuth
import KakaoSDKUser

struct ContentView: View {
    @State private var isLoggedIn: Bool = false
    @State private var userInfo: String = ""

    var body: some View {
        VStack {
            if isLoggedIn {
                Text("User Info: \(userInfo)")
            } else {
                Button(action: {
                    loginWithKakao()
                }) {
                    Text("Login with Kakao")
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }

    func loginWithKakao() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("loginWithKakaoTalk() success.")
                    getUserInfo()
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("loginWithKakaoAccount() success.")
                    getUserInfo()
                }
            }
        }
    }

    func getUserInfo() {
        UserApi.shared.me { (user, error) in
            if let error = error {
                print(error)
            } else {
                print("User info: \(String(describing: user))")
                isLoggedIn = true
                userInfo = user?.kakaoAccount?.profile?.nickname ?? "No Name"
            }
        }
    }
}
