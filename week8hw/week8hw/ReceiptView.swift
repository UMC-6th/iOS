//
//  ReceiptView.swift
//  week8hw
//
//  Created by 이재용 on 5/30/24.
//

import SwiftUI

struct ReceiptView : View {
    @ObservedObject var menuViewModel: MenuViewModel
    @State var TotalPrice: Int = 0
    var body: some View {
        VStack {
            ForEach(menuViewModel.orderList){ order in
                orderCellView(order: order)
            }
            
            Text ("합계")
                .background(.red)
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
            Text ("\(menuViewModel.calcAll())")
        }
        
    }
    
    @ViewBuilder
    func orderCellView(order: Order) -> some View {
        VStack {
            Text(order.size.description)
            ForEach(order.dough, id: \.self) { dough in
                Text(dough.description)
            }
        }
        .background(.mint)
    }
}

#Preview {
    ReceiptView(menuViewModel: MenuViewModel())
}
