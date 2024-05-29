//
//  NextView.swift
//  Week8
//
//  Created by 김승원 on 5/29/24.
//

import SwiftUI

struct NextView: View {
    
    let screenWidth = UIScreen.main.bounds.width
    
    @Binding var price: Int
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Text("\(price)원 배달 🍕")
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.white)
                .frame(width: screenWidth - 20, height: 50)
                .background(.brown)
                .cornerRadius(5)
                .padding(.bottom, 10)
            
        }
        .navigationTitle("장바구니")
//        .navigationBarTitleDisplayMode(.large)
    }
}
