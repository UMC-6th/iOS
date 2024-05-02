import UIKit

// 데이터셋 정의
struct ProductCellDataset {
    let imageStr: String
    let title: String
    let address: String
    let price: String
    var chatNum: Int
    var heartNum: Int
}

struct EventCellDataset {
    let imageStr: String
    let title: String
    let leftSubtitle: String
    let rightSubtitle: String
}

struct CollectionCellDataset {
    let imageStr: String
    let title: String
    let price: String
}

// 예제 데이터
let productCellData: [ProductCellDataset] = [
    ProductCellDataset(imageStr: "laptopcomputer", title: "MacBook Pro", address: "서울시 강남구", price: "₩2,000,000", chatNum: 5, heartNum: 20),
    ProductCellDataset(imageStr: "phone.fill", title: "iPhone 12", address: "서울시 송파구", price: "₩1,500,000", chatNum: 3, heartNum: 15),
    ProductCellDataset(imageStr: "tv.fill", title: "Samsung TV", address: "서울시 서초구", price: "₩1,800,000", chatNum: 10, heartNum: 5),
    ProductCellDataset(imageStr: "headphones", title: "Beats Headphones", address: "서울시 중구", price: "₩300,000", chatNum: 7, heartNum: 12),
    ProductCellDataset(imageStr: "camera.fill", title: "Canon DSLR", address: "서울시 용산구", price: "₩850,000", chatNum: 2, heartNum: 22),
    ProductCellDataset(imageStr: "printer.fill", title: "HP Printer", address: "서울시 마포구", price: "₩150,000", chatNum: 6, heartNum: 9),
    ProductCellDataset(imageStr: "keyboard", title: "Mechanical Keyboard", address: "서울시 광진구", price: "₩200,000", chatNum: 8, heartNum: 14),
    ProductCellDataset(imageStr: "desktopcomputer", title: "Dell Monitor", address: "서울시 강동구", price: "₩450,000", chatNum: 4, heartNum: 19)
]

let eventCellData: [EventCellDataset] = [
    EventCellDataset(imageStr: "calendar", title: "Tech Conference", leftSubtitle: "May 25, 2024", rightSubtitle: "10:00 AM"),
    EventCellDataset(imageStr: "paperplane.fill", title: "Startup Pitch Day", leftSubtitle: "June 30, 2024", rightSubtitle: "1:00 PM")
]

let collectionCellData: [CollectionCellDataset] = [
    CollectionCellDataset(imageStr: "folder.fill", title: "Documents", price: "20 Files"),
    CollectionCellDataset(imageStr: "music.note", title: "Music", price: "50 Songs"),
    CollectionCellDataset(imageStr: "film", title: "Movies", price: "10 Films"),
    CollectionCellDataset(imageStr: "book.fill", title: "Books", price: "5 Ebooks"),
    CollectionCellDataset(imageStr: "car.fill", title: "Vehicles", price: "3 Cars"),
    CollectionCellDataset(imageStr: "airplane", title: "Flights", price: "5 Tickets"),
    CollectionCellDataset(imageStr: "cart.fill", title: "Shopping", price: "20 Items"),
    CollectionCellDataset(imageStr: "house.fill", title: "Real Estate", price: "2 Properties")
]
