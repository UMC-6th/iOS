//
//  ContentView.swift
//  Week8
//
//  Created by 김승원 on 5/29/24.
//

import SwiftUI

struct ContentView: View {
    
    let screenWidth = UIScreen.main.bounds.width
    
    @State var price: Int = 0
    
    @State var flagA: Bool = false
    @State var flagB: Bool = false
    @State var flagC: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack(spacing: 0) {
                        // MARK: - 이미지
                        Image("pizzaImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: screenWidth)
                        
                        // MARK: - 타이틀, 설명
                        VStack(alignment: .leading, spacing: 8) {
                            // 타이틀
                            HStack(spacing: 7) {
                                Image("titleImage")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 35, height: 35)
                                    .padding(.top, 5)
                                
                                Text("[재주문1위] 바삭닭껍질피자")
                                    .font(.system(size: 21, weight: .semibold))
                                
                                Spacer()
                            } // 타이틀
                            
                            // 설명
                            Text("바싹 튀긴 닭껍질의 풍미를 입안 가득 느낄 수 있는 마고피자의 야심작")
                                .font(.system(size: 17, weight: .light))
                                .foregroundStyle(.secondary)
                            
                            // 영양성분 버튼
                            Button {
                                print("영양성분 보기 버튼")
                            } label: {
                                Text("영양성분 및 알레르기성분 표시 보기")
                                    .font(.system(size: 14, weight: .light))
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 10)
                                    .background(.brown)
                                    .cornerRadius(8)
                            }
                        } // 타이틀, 설명
                        .padding(.top, 8)
                        .padding(.bottom, 18)
                        .padding(.horizontal, 20)
                        .background(.white)
                        .padding(.bottom, 20)
                        
                        // MARK: - 라디오 버튼 부분
                        // 가격, 필수
                        VStack(spacing:20) {
                            HStack(spacing: 0) {
                                Text("가격")
                                    .font(.system(size: 20, weight: .medium))
                                
                                Spacer()
                                
                                Text("필수")
                                    .font(.system(size: 15))
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 3)
                                    .background(.brown)
                                    .cornerRadius(18)
                            }
                            
                            // 라디오 버튼
                            // M 버튼
                            HStack(spacing: 7) {
                                Image(systemName: flagA ? "circle.fill" : "circle")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(.brown)
                                    .onTapGesture {
                                        flagA = true
                                        flagB = false
                                        if flagC {
                                            price = 24500
                                        } else {
                                            price = 20000
                                        }
                                    }
                                
                                Text("M")
                                    .font(.system(size: 18))
                                
                                Spacer()
                                
                                Text("20,000원")
                                    .font(.system(size: 18))
                            } // M 버튼
                            
                            // L 버튼
                            HStack(spacing: 7) {
                                Image(systemName: flagB ? "circle.fill" : "circle")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(.brown)
                                    .onTapGesture {
                                        flagA = false
                                        flagB = true
                                        if flagC {
                                            price = 27500
                                        } else {
                                            price = 23000
                                        }
                                    }
                                
                                Text("L")
                                    .font(.system(size: 18))
                                
                                Spacer()
                                
                                Text("23,000원")
                                    .font(.system(size: 18))
                            } // L 버튼
                        }
                        // 라디오 버튼 부분
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                        .background(.white)
                        .padding(.bottom, 20)
                        
                        // MARK: - 라디오 버튼 부분
                        // 가격, 필수
                        VStack(alignment: .leading, spacing:20) {
                            HStack(spacing: 0) {
                                Text("도우변경")
                                    .font(.system(size: 20, weight: .medium))
                                
                                Spacer()
                                
                                Text("선택")
                                    .font(.system(size: 15))
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 3)
                                    .background(.gray)
                                    .cornerRadius(18)
                            }
                            
                            Text("최대 1개 선택")
                                .font(.system(size: 13, weight: .regular))
                                .foregroundStyle(.gray)
                                .padding(.top, -13)
                            
                            // 라디오 버튼
                            // M 버튼
                            HStack(spacing: 7) {
                                Image(systemName: flagC ? "square.fill" : "square")
                                    .resizable()
                                    .frame(width: 22, height: 22)
                                    .foregroundStyle(.brown)
                                    .onTapGesture {
                                        if flagA || flagB {
                                            flagC.toggle()
                                            if flagC {
                                                price += 4500
                                            } else {
                                                price -= 4500
                                            }
                                        }
                                    }
                                
                                Text("치즈크러스트")
                                    .font(.system(size: 18))
                                
                                Spacer()
                                
                                Text("+ 4,500원")
                                    .font(.system(size: 18))
                            } // M 버튼
                            
                        }
                        // 라디오 버튼 부분
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                        .background(.white)
                        
                        Spacer()
                    }
                    .frame(height: 795)
                } // 스크롤 뷰
                .background(.brown)
                .ignoresSafeArea()
                
                // 아래 탭바..ㅎ
                VStack(spacing: 0) {
                    Spacer()
                    
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 3) {
                            Text("배달최소주문금액")
                                .font(.system(size: 12))
                                .foregroundStyle(.gray)
                            
                            Text("17,000원")
                                .font(.system(size: 17))
                        } // 최소주문금액레이블
                        
                        Spacer()
                        
                        // 주문 버튼
                        if price > 17000 {
                            NavigationLink(destination: NextView(price: $price)) {
                                                Text("\(price)원 담기")
                                                    .font(.system(size: 18))
                                                    .foregroundColor(.white)
                                                    .frame(width: screenWidth - 150, height: 50)
                                                    .background(.brown)
                                                    .cornerRadius(5)
                                            }
                                        } else {
                                            Text("\(price)원 담기")
                                                .font(.system(size: 18))
                                                .foregroundColor(.white)
                                                .frame(width: screenWidth - 150, height: 50)
                                                .background(Color.gray)
                                                .cornerRadius(5)
                                        }
                        
                        
                    } // 탭바
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(.white)
                }
            } // ZStack
        } // 네비 스택
    }
}

#Preview {
    ContentView()
}
