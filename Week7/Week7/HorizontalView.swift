//
//  HorizontalView.swift
//  Week7
//
//  Created by 김승원 on 5/26/24.
//

import SwiftUI

struct HorizontalView: View {
    var image: String
    var title: String
    var price: String
    
    init(image: String, title: String, price: String) {
        self.image = image
        self.title = title
        self.price = price
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Image("tempImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(8)
                .clipped()
            
            Text("얼음 트레이 소 (얼음판/ 개당 판매")
                .font(.system(size: 16))
                .frame(width: 100)
                .lineLimit(2)
            
            Text("62,000원")
                .font(.system(size: 16, weight: .semibold))
                
        }
    }
}

#Preview {
    HorizontalView(image: "tempImage", title: "실리콘 얼음틀(개당 판매합니다~~)", price: "62,000원")
}
