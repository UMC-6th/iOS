//
//  ContentView.swift
//  Week7
//
//  Created by 이승민 on 5/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - 상단 바
            HStack(spacing: 10) {
                Text("우리집")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)

                Spacer()

                Button(action: {
                    print("line.3.horizontal Button Tapped")
                }) {
                    Image(systemName: "line.3.horizontal")
                }

                Button(action: {
                    print("magnifyingglass Button Tapped")
                }) {
                    Image(systemName: "magnifyingglass")
                }

                Button(action: {
                    print("bell Button Tapped")
                }) {
                    Image(systemName: "bell")
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 15)
            .foregroundColor(.black)

            // MARK: - 전체 스크롤 뷰
            ScrollView {
                VStack(spacing: 0) {
                    // MARK: - Horizontal
                    VStack(spacing: 18) {
                        
                        // Horizontal ScrollView
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(0..<7) { _ in
                                    HorizontalView(image: "star", title: "테스트 게시물 입니다", price: "20000원")
                                }
                            }
                            .padding(.horizontal, 10)
                        }
                        
                    }
                    .padding(.vertical, 25)
                    .background(Color.white)
                    
                    // MARK: - Vertical
                    ForEach(0..<8) { _ in
                        VerticalView(image: "person", title: "싸게 팔아요", place: "부천시 역곡동", price: "30000원", heart: "5", message: "13")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
