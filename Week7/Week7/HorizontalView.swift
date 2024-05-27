//
//  HorizontalView.swift
//  Week7
//
//  Created by 이승민 on 5/26/24.
//

import SwiftUI

struct HorizontalView: View {
    var image: String
    var title: String
    var price: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(8)
                .clipped()
            
            Text(title)
                .font(.system(size: 16))
                .frame(width: 100)
                .lineLimit(2)
            
            Text(price)
                .font(.system(size: 16, weight: .semibold))
        }
    }
}

#Preview {
    HorizontalView(image: "star", title: "실리콘 얼음틀(개당 판매합니다~~)", price: "62,000원")
}
