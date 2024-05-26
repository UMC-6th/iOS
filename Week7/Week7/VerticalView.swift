//
//  VerticalView.swift
//  Week7
//
//  Created by 이승민 on 5/26/24.
//

import SwiftUI

struct VerticalView: View {
    var image: String
    var title: String
    var place: String
    var price: String
    var heart: String
    var message: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(8)
                .clipped()
            
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
                
                HStack {
                    Spacer()
                    Image(systemName: "heart")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 12, height: 12)
                        .foregroundColor(.secondary)
                    Text(heart)
                        .font(.system(size: 13))
                        .foregroundStyle(.secondary)
                    Image(systemName: "message")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 12, height: 12)
                        .foregroundColor(.secondary)
                    Text(message)
                        .font(.system(size: 13))
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.trailing, 13)
        }
        .padding(10)
    }
}

#Preview {
    VerticalView(image: "heart", title: "에어팟맥스", place: "서울특별시 양천구", price: "370,000원", heart: "5", message: "13")
}
