//
//  SecondView.swift
//  Week8
//
//  Created by 이승민 on 5/31/24.
//

import SwiftUI

struct SecondView: View {
    let selectedPrice: String
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Button(action: {
                    // Add action here
                }) {
                    HStack {
                        Text("배달 주문하기")
                        Spacer()
                        Text(selectedPrice)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.mint)
                    .cornerRadius(5)
                }
                .frame(height: 40)
                .padding(.horizontal, 20)
            }
        }
        .background(Color.white)
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(selectedPrice: "20,000원")
    }
}
