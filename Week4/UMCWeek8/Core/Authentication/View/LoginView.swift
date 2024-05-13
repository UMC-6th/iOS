//
//  LoginView.swift
//  UMCWeek8
//
//  Created by 이승민 on 11/30/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
     
    var body: some View {
        
        NavigationStack {
            VStack {
                // 이미지
                Image("SpongeBob")
                    .resizable()
                    .scaledToFill()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 200)
                    .padding(.vertical,32)
                
                // form fields
                VStack(spacing: 24) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "이메일을 입력해주세요")
                    .autocapitalization(.none) // 자동 대문자변환 끄기
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "비밀번호를 6자리 이상 입력해주세요",
                              isSecureField: true) // InputView에서 flase로 지정해줬기 때문에
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // 로그인 버튼
                Button {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    HStack {
                        Text("로그인")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5) // 불투명도
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                // 회원가입 버튼
                NavigationLink {
                    RegistrationView() // 회원가입 View로 이동
                        .navigationBarBackButtonHidden() // Back 버튼 안보이게
                } label: {
                    HStack {
                        Text("가입된 계정이 없으신가요?")
                        Text("회원가입")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 15))
                }

            }
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5 // Firebase에서는 비밀번호가 6자 이상이어야 함
    }
}

#Preview {
    LoginView()
}
