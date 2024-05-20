//
//  TabView.swift
//  Week6
//
//  Created by 김승원 on 5/15/24.
//

import SwiftUI

struct MyTabView: View {
    
    @State private var selectedTab = 2
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            Text("1")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }
                .tag(0)
            
            Text("2")
                .tabItem {
                    Image(systemName: "suit.heart")
                    Text("찜")
                }
                .tag(1)
            
            ContentView()
                .tabItem {
                    Image(systemName: "paperplane.circle.fill")
                    Text("배민")
                }
                .tag(2)
                .onAppear {
                    selectedTab = 2
                }
            
            Text("4")
                .tabItem {
                    Image(systemName: "note.text")
                    Text("주문내역")
                }
                .tag(3)
            
            Text("5")
                .tabItem {
                    Image(systemName: "face.smiling")
                    Text("my배민")
                }
                .tag(4)
        } // TabView
        .background(.black.opacity(0.5))
        
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
