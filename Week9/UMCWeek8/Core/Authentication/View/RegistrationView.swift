//
//  RegistrationView.swift
//  UMCWeek8
//
//  Created by 이승민 on 11/30/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var nickname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        VStack {
            
            Image("SpongeBob")
                .resizable()
                .scaledToFill()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 200)
                .padding(.vertical,32)
        }
        
        VStack(spacing: 24) {
            InputView(text: $email,
                      title: "Email Address",
                      placeholder: "이메일을 입력해주세요")
            .autocapitalization(.none) // 자동 대문자변환 끄기
            
            InputView(text: $nickname,
                      title: "NickName",
                      placeholder: "닉네임을 입력해주세요")
            
            InputView(text: $password,
                      title: "Password",
                      placeholder: "비밀번호를 6자리 이상 입력해주세요",
                      isSecureField: true) // InputView에서 flase로 지정해줬기 때문에
            
            ZStack(alignment: .trailing) {
                InputView(text: $confirmPassword,
                          title: "Confirm Password",
                          placeholder: "비밀번호를 다시 입력해주세요",
                          isSecureField: true) // InputView에서 flase로 지정해줬기 때문에
                if !password.isEmpty && !confirmPassword.isEmpty {
                    if password == confirmPassword {
                        Image(systemName: "checkmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemGreen))
                    } else {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemRed))
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 12)
        
        
        
        Button {
            Task {
                try await viewModel.createUser(withEmail: email,
                                               password: password,
                                               nickname: nickname)
            }
        } label: {
            HStack {
                Text("회원가입")
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
        
        Button(action: {
            dismiss()
        }, label: {
            HStack {
                Text("이미 가입된 계정이 있으신가요?")
                Text("로그인")
                    .fontWeight(.bold)
            }
            .font(.system(size: 15))
        })
    }
}

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5 // Firebase에서는 비밀번호가 6자 이상이어야 함
        && confirmPassword == password
        && !nickname.isEmpty
    }
}

#Preview {
    RegistrationView()
}
