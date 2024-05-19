//
//  ContentView.swift
//  Week6
//
//  Created by 이승민 on 5/16/24.
//

import SwiftUI

struct ContentView: View {
    @State var keyword: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.white
                .ignoresSafeArea()
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: 100)
                        .foregroundStyle(.mint)
                    
                    VStack {
                        HStack{
                            Text("우리집")
                            
                            Spacer()
                            
                            Button(action: {
                                print("눌림")
                            }, label: {
                                Image(systemName: "square")
                            })
                            Button(action: {
                                print("눌림")
                            }, label: {
                                Image(systemName: "bell")
                            })
                            Button(action: {
                                print("눌림")
                            }, label: {
                                Image(systemName: "cart")
                            })
                        }
                        .padding(.horizontal)

                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("검색해주세요", text: $keyword)
                        }
                        .padding(10)
                        .background(.white)
                        .padding(.horizontal)
                    }
                }
                
                
                ZStack {
                    Rectangle()
                        .padding(.horizontal, 20)
                        .frame(width: UIScreen.main.bounds.width, height: 100)
                        .foregroundStyle(.red)
                    Text("집콕러세요?")
                }
                
                HStack {
                    ZStack {
                        Rectangle()
                            .padding(.leading, 28)
                            .frame(width: UIScreen.main.bounds.width / 3, height: 100)
                            .foregroundStyle(.orange)
                        Text("알뜰배달")
                    }
                    ZStack {
                        Rectangle()
                            .padding(.horizontal, 5)
                            .frame(width: UIScreen.main.bounds.width / 3, height: 100)
                            .foregroundStyle(.orange)
                        Text("배달")
                    }
                    ZStack {
                        Rectangle()
                            .padding(.trailing, 28)
                            .frame(width: UIScreen.main.bounds.width / 3, height: 100)
                            .foregroundStyle(.orange)
                        Text("배민스토어")
                    }
                    
                }
                
                ZStack {
                    Rectangle()
                        .padding(.horizontal, 20)
                        .frame(width: UIScreen.main.bounds.width, height: 200)
                        .foregroundStyle(.blue)
                    Text("대용량특가")
                }
                
                ZStack {
                    Rectangle()
                        .padding(.horizontal, 20)
                        .frame(width: UIScreen.main.bounds.width, height: 100)
                        .foregroundStyle(.green)
                    Text("광고")
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
