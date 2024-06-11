//
//  ContentView.swift
//  Week10
//
//  Created by 김승원 on 6/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var kakaoAuthVM = kakaoAuthViewModel()
    
    let loginStatusInfo : (Bool) -> String = { isLoggedIn in
        return isLoggedIn ? "로그인 상태 ⭐️" : "로그아웃 상태"
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                Text(loginStatusInfo(kakaoAuthVM.isLoggedIn))
                Button("카카오톡 로그인", action: {
                    kakaoAuthVM.handleKakaoLogin()
                })
                Button("카카오톡 로그아웃", action: {
                    kakaoAuthVM.kakaoLogout()
                })
                Divider()
                NavigationLink(destination: ApiView()) {
                    Text("Api 사용")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
