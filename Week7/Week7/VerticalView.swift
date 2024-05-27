//
//  VerticalView.swift
//  Week7
//
//  Created by 김승원 on 5/26/24.
//

import SwiftUI

struct VerticalView: View {
    // MARK: - Variables
    var image: String
    var title: String
    var place: String
    var price: String
    var heart: String
    
    // MARK: - Life Cycle
    init(image: String, title: String, place: String, price: String, heart: String) {
        self.image = image
        self.title = title
        self.place = place
        self.price = price
        self.heart = heart
    }
    
    var body: some View {
        HStack(spacing: 0) {
            // MARK: - 이미지
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(8)
                .clipped()
                .padding(.trailing, 13)
            
            // MARK: - 제목, 위치, 가격
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 18, weight: .regular))
                    .padding(.bottom, 3)
                Text(place)
                    .font(.system(size: 14, weight: .thin))
                    .foregroundStyle(.secondary)
                Text(price)
                    .font(.system(size: 19, weight: .semibold))
                
                Spacer()
                
                // MARK: - 좋아요 수
                HStack(spacing: 0) {
                    Spacer()
                    
                    Image(systemName: "heart")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 12, height: 12)
                        .foregroundColor(.secondary)
                        .padding(.trailing, 5)
                    
                    Text(heart)
                        .font(.system(size: 13))
                        .foregroundStyle(.secondary)
                }
            }
        } // 겉에 HStack
        .padding(10)
    }
}

#Preview {
    VerticalView(image: "tempImage", title: "에어팟맥스", place: "서울특별시 양천구", price: "370,000원", heart: "5")
}
