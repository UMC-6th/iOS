//
//  DataManager.swift
//  Week2
//
//  Created by 이승민 on 4/17/24.
//

import UIKit

struct DataManager {
    private let productArray: [Product] = [
        Product(tumnailImage: UIImage(systemName: "heart.fill"), title: "에어팟맥스실버", place: "서울특별시 양천구", price: "370,000", commentNum: "5", heartNum: "23"),
        Product(tumnailImage: UIImage(systemName: "star.fill"), title: "에어팟 맥스 스페이스그레이 S급 판매합니다.", place: "서울특별시 양천구", price: "490,000", commentNum: "1", heartNum: "4"),
        Product(tumnailImage: UIImage(systemName: "book.pages"), title: "에어팟맥스실버", place: "서울특별시 양천구", price: "370,000", commentNum: "5", heartNum: "23"),
        Product(tumnailImage: UIImage(systemName: "apple.logo"), title: "에어팟 맥스 스페이스그레이 S급 판매합니다.", place: "서울특별시 양천구", price: "490,000", commentNum: "1", heartNum: "4"),
        Product(tumnailImage: UIImage(systemName: "gamecontroller"), title: "에어팟맥스실버", place: "서울특별시 양천구", price: "370,000", commentNum: "5", heartNum: "23"),
        Product(tumnailImage: UIImage(systemName: "applewatch"), title: "에어팟 맥스 스페이스그레이 S급 판매합니다.", place: "서울특별시 양천구", price: "490,000", commentNum: "1", heartNum: "4"),
        Product(tumnailImage: UIImage(systemName: "figure.walk"), title: "에어팟맥스실버", place: "서울특별시 양천구", price: "370,000", commentNum: "5", heartNum: "23"),
        Product(tumnailImage: UIImage(systemName: "face.smiling.inverse"), title: "에어팟 맥스 스페이스그레이 S급 판매합니다.", place: "서울특별시 양천구", price: "490,000", commentNum: "1", heartNum: "4"),
    ]
    
    func getProductData() -> [Product] {
        return productArray
    }
}
