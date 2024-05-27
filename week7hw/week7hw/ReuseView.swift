//
//  ReuseView.swift
//  week7hw
//
//  Created by 이재용 on 5/26/24.
//

import SwiftUI

struct ItemCellView : View {
    let dataset: ItemCellDataset
    
    var body: some View {
        HStack{
            Image(systemName: dataset.imagename)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .background(.green)
                .cornerRadius(15)
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text(dataset.title)
                Text(dataset.address + "-" + dataset.time)
                Text(dataset.price)
                HStack{
                    Spacer()
                    Image(systemName: "bubble")
                    Text(dataset.chatcount)
                    Image(systemName: "heart")
                    Text(dataset.heartcount)
                }
            }
        }
        .frame(height: 150)
        .padding(.horizontal)
    }
}

struct AdCellView: View {
    let dataset: AdCellDataset
    var body: some View {
        VStack(alignment:.center) {
            Image(systemName: dataset.imagename)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .background(.green)
                .cornerRadius(15)
                .padding(.trailing)
            Text(dataset.title)
            Text(dataset.price)
        }
        .frame(width: 150)
    }
}

struct ItemCellDataset : Identifiable{
    let id = UUID()
    let imagename: String
    let title: String
    let address: String
    let time: String
    let price: String
    let booked: Bool
    let chatcount: String
    let heartcount: String
}

struct EventCellDataset {
    let imagename: String
    let title: String
    let leftword: String
    let rightword: String
}

struct AdCellDataset : Identifiable {
    let id = UUID()
    let imagename: String
    let title: String
    let price: String
}

// 데이터 생성
let itemCellData: [ItemCellDataset] = [
    ItemCellDataset(imagename: "house", title: "Lovely House", address: "123 Main St", time: "10:00 AM", price: "100,000원", booked: true, chatcount: "5", heartcount: "10"),
    ItemCellDataset(imagename: "car", title: "Sedan", address: "456 Elm St", time: "2:00 PM", price: "500,000원", booked: false, chatcount: "3", heartcount: "7"),
    ItemCellDataset(imagename: "bicycle", title: "Mountain Bike", address: "789 Pine St", time: "5:00 PM", price: "200,000원", booked: true, chatcount: "2", heartcount: "5"),
    ItemCellDataset(imagename: "tv", title: "Smart TV", address: "101 Oak St", time: "6:00 PM", price: "800,000원", booked: false, chatcount: "8", heartcount: "15"),
    ItemCellDataset(imagename: "laptopcomputer", title: "Laptop", address: "202 Maple St", time: "9:00 AM", price: "1,200,000원", booked: true, chatcount: "1", heartcount: "12")
]

let eventCellData: [EventCellDataset] = [
    EventCellDataset(imagename: "calendar", title: "Event 1", leftword: "Starts Soon", rightword: "Don't Miss It"),
    EventCellDataset(imagename: "star", title: "Event 2", leftword: "Limited Time", rightword: "Join Now")
]

let adCellData: [AdCellDataset] = [
    AdCellDataset(imagename: "tag", title: "Discount Tag", price: "50,000원"),
    AdCellDataset(imagename: "ticket", title: "Event Ticket", price: "30,000원"),
    AdCellDataset(imagename: "gift", title: "Gift Box", price: "70,000원"),
    AdCellDataset(imagename: "cart", title: "Shopping Cart", price: "90,000원"),
    AdCellDataset(imagename: "bag", title: "Travel Bag", price: "120,000원"),
    AdCellDataset(imagename: "camera", title: "Digital Camera", price: "150,000원"),
    AdCellDataset(imagename: "headphones", title: "Headphones", price: "80,000원"),
    AdCellDataset(imagename: "watch", title: "Wrist Watch", price: "200,000원"),
    AdCellDataset(imagename: "phone", title: "Smartphone", price: "300,000원"),
    AdCellDataset(imagename: "laptopcomputer", title: "Laptop Computer", price: "1,200,000원")
]

#Preview {
//    ItemCellView(dataset: itemCellData[0])
    AdCellView(dataset: adCellData[0])
}
