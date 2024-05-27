//
//  ContentView.swift
//  Week6
//
//  Created by 김승원 on 5/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 10) {
                HStack(spacing: 10){
                    Text("우리집")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        print("4*4 square Button Tapped")
                    } label: {
                        Image(systemName: "square.grid.2x2")
                    }
                    
                    Button {
                        print("bell Button Tapped")
                    } label: {
                        Image(systemName: "bell")
                    }
                    
                    Button {
                        print("cart Button Tapped")
                    } label: {
                        Image(systemName: "cart")
                    }
                }  // 우리집, 버튼들
                .foregroundColor(.white)
                
                HStack(spacing: 0) {
                    Image(systemName: "magnifyingglass")
                    
                    TextField("오늘은 피자가 당긴다..!", text: $text)
                    
                } // 텍스트 필드
                .padding(10)
                .background(.white)
                .cornerRadius(5)
                
            } // 상단 뷰
            .padding(10)
            .padding(.bottom, 10)
            .background(.red)
        
            
            ScrollView {
                VStack(spacing: 12) {
                    Text("통학러세요? 안타깝네요.ㅠㅠ!!")
                        .frame(maxWidth: .infinity, minHeight: 70)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    
                    HStack(alignment: .center, spacing: 15) {
                        Text("알뜰배달")
                            .frame(maxWidth: .infinity, minHeight: 120)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                        
                        Text("배달")
                            .frame(maxWidth: .infinity, minHeight: 120)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                        
                        Text("배민스토어")
                            .frame(maxWidth: .infinity, minHeight: 120)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    } // 알뜰, 배달, 배민스토어
                    
                    Text("대용량특가")
                        .frame(maxWidth: .infinity, minHeight: 220)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    
                    Image("bannerImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, minHeight: 180)
                        .background(Color.white)
                        .cornerRadius(10)
                        .clipped()
                }
                .padding(.horizontal, 10)
                .padding(.top, 10)
            } // ScrollView
            Spacer()
        } // VStack
    }
}


#Preview {
    ContentView()
}
