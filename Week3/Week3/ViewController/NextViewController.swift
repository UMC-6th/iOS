//
//  NextViewController.swift
//  Week3
//
//  Created by 이승민 on 4/17/24.
//

import UIKit

final class NextViewController: UIViewController {
    // MARK: - Properties
    var price: Int? = nil
    
    private let nextView = NextView()
    
    // MARK: - View 설정
    override func loadView() {
        view = nextView
    }
    
    // MARK: - ViewDidLodad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepare()
        setupNaviBar()
    }
    
    private func prepare() {
        guard let price = self.price else { return }
        nextView.completeButton.setTitle("\(price)원", for: .normal)
    }
    
    private func setupNaviBar() {
        title = "장바구니"
    }
}
