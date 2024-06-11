//
//  FirstView.swift
//  Week8
//
//  Created by 이승민 on 5/31/24.
//

import SwiftUI

struct FirstView: View {
    @State private var selectedSize: PizzaSize? = nil
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15) {
                Image("pizza")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .clipped()
                
                Text("[재주문 1위] 바싹불고기피자")
                    .font(.system(size: 25, weight: .bold))
                    .padding(.horizontal, 20)
                
                Text("바싹 익힌 불고기의 풍미를 입안 가득 느낄 수 있는 자가제빵선명희피자의 야심작")
                    .foregroundColor(.gray)
                    .padding(.horizontal, 20)
                
                Divider()
                    .background(Color.gray.opacity(0.4))
                    .frame(height: 15)
                
                Text("가격")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.horizontal, 20)
                
                VStack(spacing: 20) {
                    HStack {
                        Button(action: {
                            selectedSize = .medium
                        }) {
                            Image(systemName: selectedSize == .medium ? "largecircle.fill.circle" : "circle")
                                .foregroundColor(.blue)
                        }
                        Text("M                                  20,000원")
                    }
                    
                    HStack {
                        Button(action: {
                            selectedSize = .large
                        }) {
                            Image(systemName: selectedSize == .large ? "largecircle.fill.circle" : "circle")
                                .foregroundColor(.blue)
                        }
                        Text("L                                   23,000원")
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                NavigationLink(destination: SecondView(selectedPrice: selectedSize == .medium ? "20,000원" : "23,000원")) {
                    Text(selectedSize == .medium ? "20,000원" : selectedSize == .large ? "23,000원" : "0원")
                        .foregroundColor(.white)
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(selectedSize == nil ? Color.gray : Color.mint)
                        .cornerRadius(5)
                }
                .disabled(selectedSize == nil)
                .padding(.horizontal, 20)
            }
            .background(Color.white)
        }
    }
    
    enum PizzaSize {
        case medium, large
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
