//
//  InputView.swift
//  UMCWeek8
//
//  Created by 이승민 on 11/30/23.
//

import SwiftUI

struct InputView: View { // 재사용
    
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecureField {
                SecureField(placeholder, text: $text) // 보안 텍스트필드
                    .font(.system(size: 14))
            } else {
                TextField(placeholder, text: $text) // 일반 텍스트필드
                    .font(.system(size: 14))
            }
            
            Divider() // 구분선
        }
    }
}

#Preview {
    InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
}
