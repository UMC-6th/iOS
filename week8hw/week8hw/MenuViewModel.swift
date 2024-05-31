//
//  MenuViewModel.swift
//  week8hw
//
//  Created by 이재용 on 5/30/24.
//

import SwiftUI

class MenuViewModel : ObservableObject {
    @Published var sizeSelect: size = .none
    @Published var doughSelect: [dough] = []
    @Published var orderList: [Order] = []
    @Published var gotoReceipt = false
   
    func calcAll() -> Int {
        var temp = 0
        orderList.forEach { Order in
           temp += Order.size.rawValue
            Order.dough.forEach { dough in
                temp += dough.rawValue
            }
        }
        return temp
    }
    func calcTotal() -> Int {
        var temp = 0
        temp = sizeSelect.rawValue
        doughSelect.forEach({ dough in
            temp += dough.rawValue
        })
        return temp
    }
    
    func resetAndAppend() {
        let order = Order(size: sizeSelect, dough: doughSelect)
        orderList.append(order)
        sizeSelect = .none
        doughSelect = []
        
    }
}
enum size: Int {
    case Medium = 15000
    case Large = 20000
    case none = 0
    
    var description: String {
            switch self {
            case .Medium:
                return "중간"
            case .Large:
                return "큰"
            case .none:
                return "없음"
            }
        }
}

enum dough : Int {
    case cheeze = 3000
    case gold = 4000
    case sweetpotato = 5000
    case none = 0
    
    var description: String {
            switch self {
            case .cheeze:
                return "치즈"
            case .gold:
                return "골드"
            case .sweetpotato:
                return "고구마"
            case .none:
                return "없음"
            }
        }
}
struct Order: Identifiable {
    let id = UUID()
    let size: size
    let dough: [dough]
}
