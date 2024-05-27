//
//  ContentView.swift
//  Week7
//
//  Created by 김승원 on 5/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - 상단 바

            HStack(spacing: 10){
                Text("우리집")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    print("line.3.horizontal Button Tapped")
                } label: {
                    Image(systemName: "line.3.horizontal")
                }
                
                Button {
                    print("magnifyingglass Button Tapped")
                } label: {
                    Image(systemName: "magnifyingglass")
                }
                
                Button {
                    print("bell Button Tapped")
                } label: {
                    Image(systemName: "bell")
                }
            }  // 우리집, 버튼들
            .padding(.horizontal, 10)
            .padding(.vertical, 15)
            .foregroundColor(.black)
            
            // MARK: - 전체 스크롤 뷰
            ScrollView {
                VStack(spacing: 0) {
                    // MARK: - Horizontal
                    VStack(spacing: 18) {
                        // 시원한 여름 간식의 계절🍉🍧🍦  >
                        HStack(spacing: 0) {
                            Text("시원한 여름 간식의 계절🍉🍧🍦")
                                .font(.system(size: 18, weight: .semibold))
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.horizontal, 10)
                        
                        // Horizontal ScrollView
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                HorizontalView(image: "tempImage", title: "실리콘 얼음틀(개당 판매합니다~~)", price: "62,000원")
                                HorizontalView(image: "tempImage", title: "실리콘 얼음틀(개당 판매합니다~~)", price: "62,000원")
                                HorizontalView(image: "tempImage", title: "실리콘 얼음틀(개당 판매합니다~~)", price: "62,000원")
                                HorizontalView(image: "tempImage", title: "실리콘 얼음틀(개당 판매합니다~~)", price: "62,000원")
                                HorizontalView(image: "tempImage", title: "실리콘 얼음틀(개당 판매합니다~~)", price: "62,000원")
                                HorizontalView(image: "tempImage", title: "실리콘 얼음틀(개당 판매합니다~~)", price: "62,000원")
                                HorizontalView(image: "tempImage", title: "실리콘 얼음틀(개당 판매합니다~~)", price: "62,000원")
                            }
                            .padding(.horizontal, 10)
                        }
                        
                    }
                    .padding(.vertical, 25)
                    .background(.white)
                    
                    
                    
                    
                    // MARK: - Vertical

                    VerticalView(image: "tempImage", title: "에어팟맥스 실버", place: "서울특별시 양천구", price: "300,000원", heart: "5")
                    VerticalView(image: "tempImage", title: "에어팟맥스 실버", place: "서울특별시 양천구", price: "300,000원", heart: "5")
                    VerticalView(image: "tempImage", title: "에어팟맥스 실버", place: "서울특별시 양천구", price: "300,000원", heart: "5")
                    VerticalView(image: "tempImage", title: "에어팟맥스 실버", place: "서울특별시 양천구", price: "300,000원", heart: "5")
                    VerticalView(image: "tempImage", title: "에어팟맥스 실버", place: "서울특별시 양천구", price: "300,000원", heart: "5")
                    VerticalView(image: "tempImage", title: "에어팟맥스 실버", place: "서울특별시 양천구", price: "300,000원", heart: "5")
                    VerticalView(image: "tempImage", title: "에어팟맥스 실버", place: "서울특별시 양천구", price: "300,000원", heart: "5")
                    VerticalView(image: "tempImage", title: "에어팟맥스 실버", place: "서울특별시 양천구", price: "300,000원", heart: "5")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
