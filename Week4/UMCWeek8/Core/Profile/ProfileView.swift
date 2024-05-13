//
//  ProfileView.swift
//  UMCWeek8
//
//  Created by 이승민 on 11/30/23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.initials) // 모의 사용자 넣기
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.nickname)
                                .font(.subheadline)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .accentColor(.gray)
                        }
                    }
                }
                
                Section("일반") {
                    HStack {
                        SettingsRowView(imageName: "gear",
                                        title: "Version",
                                        tintColor: Color(.systemGray))
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Section("계정") {
                    Button {
                        viewModel.signOut()
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "로그아웃", tintColor: .red)
                    }
                    
                    Button {
                        viewModel.deleteAccout()
                    } label: {
                        SettingsRowView(imageName: "xmark.circle.fill", title: "계정삭제", tintColor: .red)
                    }

                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
