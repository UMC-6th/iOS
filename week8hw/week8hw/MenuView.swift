//
//  MenuView.swift
//  week8hw
//
//  Created by 이재용 on 5/30/24.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var menuViewModel: MenuViewModel
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    sizeselection()
                    doughselection()
                    
                    Button(action: {
                        menuViewModel.resetAndAppend()
                        menuViewModel.gotoReceipt = true
                    }, label: {
                        orderButton()
                    })
                    //네비게이션 링크에 버튼 넣으면 작동 안함
                    NavigationLink(destination: ReceiptView(menuViewModel: menuViewModel), isActive: $menuViewModel.gotoReceipt) {
                                        EmptyView()  // NavigationLink가 보이지 않게 처리
                                    }
                }
                
            }
        }
    }
    
    
    @ViewBuilder
    func orderButton() -> some View {
        
        Text("\(menuViewModel.calcTotal()) 원")
    }
    
    
    
    @ViewBuilder
    func sizeselection() -> some View {
        VStack{
            HStack {
                Text("price")
                Spacer()
                Text("needed")
            }
            
            HStack {
                Button {
                    menuViewModel.sizeSelect = .Medium
                } label: {
                    Text("Medium")
                        .foregroundStyle(menuViewModel.sizeSelect == .Medium ? .blue : .red)
                }
                Spacer()
                Text("15000 원")
            }
            HStack {
                Button {
                    menuViewModel.sizeSelect = .Large
                } label: {
                    Text("Large")
                        .foregroundStyle(menuViewModel.sizeSelect == .Large ? .blue : .red)
                }
                Spacer()
                
                Text("15000 원")
                
            }
        }
        .background(Color(.lightGray))
        .padding()
    }
    
    @ViewBuilder
    func doughselection() -> some View {
        VStack{
            HStack {
                Text("price")
                Spacer()
                Text("needed")
            }
            
            HStack {
                Button {
                    if menuViewModel.doughSelect.contains(.cheeze) {
                        // 배열에서 .gold 원소가 이미 존재하면 삭제
                        menuViewModel.doughSelect.removeAll { $0 == .cheeze }
                    } else {
                        // 배열에 .gold 원소가 없으면 추가
                        menuViewModel.doughSelect.append(.cheeze)
                    }
                } label: {
                    Text("CheezeCrust")
                        .foregroundStyle(menuViewModel.doughSelect.contains(.cheeze) ? .blue : .red)
                }
                Spacer()
                Text("3000 원")
            }
            HStack {
                Button {
                    // doughSelect 배열에서 .gold 원소를 토글하는 로직
                    if menuViewModel.doughSelect.contains(.gold) {
                        // 배열에서 .gold 원소가 이미 존재하면 삭제
                        menuViewModel.doughSelect.removeAll { $0 == .gold }
                    } else {
                        // 배열에 .gold 원소가 없으면 추가
                        menuViewModel.doughSelect.append(.gold)
                    }
                } label: {
                    Text("GoldCrust")
                        .foregroundStyle(menuViewModel.doughSelect.contains(.gold) ? .blue : .red)
                }
                Spacer()
                
                Text("4000 원")
                
            }
            
            HStack {
                Button {
                    if menuViewModel.doughSelect.contains(.sweetpotato) {
                        // 배열에서 .gold 원소가 이미 존재하면 삭제
                        menuViewModel.doughSelect.removeAll { $0 == .sweetpotato }
                    } else {
                        // 배열에 .gold 원소가 없으면 추가
                        menuViewModel.doughSelect.append(.sweetpotato)
                    }
                } label: {
                    Text("SweetPotato")
                        .foregroundStyle(menuViewModel.doughSelect.contains(.sweetpotato) ? .blue : .red)
                }
                Spacer()
                
                Text("5000 원")
                
            }
        }
        .background(Color(.lightGray))
        .padding()
    }
    
}

#Preview {
    MenuView(menuViewModel: MenuViewModel())
}
