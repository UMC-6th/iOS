//
//  ContentView.swift
//  week7hw
//
//  Created by 이재용 on 5/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            headerView()
                .padding(.horizontal)
                .background(.white)
            
            ScrollView {
                ScrollView {
                    // 수평 스크롤 뷰 추가
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: -10) {
                            ForEach(adCellData) { dataset in
                                AdCellView(dataset: dataset)
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                    .frame(height: 150)
                    
                    VStack{
                        ForEach(itemCellData) { dataset in
                            ItemCellView(dataset: dataset)
                        }
                    }
                }
                .frame(height: UIScreen.main.bounds.height - 150)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
        }
    }
        
        @ViewBuilder
        func headerView() -> some View {
            HStack{
                Text("광명동")
                Spacer()
                Image(systemName: "line.3.horizontal")
                Image(systemName: "magnifyingglass")
                Image(systemName: "bell")
            }
            
        }
    }
    
    #Preview {
        ContentView()
    }
