//
//  SecondViewController.swift
//  Week3
//
//  Created by 김승원 on 4/14/24.
//

import UIKit

class SecondViewController: UIViewController {
    // MARK: - Properties
    var price: Int? = nil
    
    private let contentView = SecondView()
    

    // MARK: - LifeCycle
    override func loadView() {
        view = contentView
        
    }
    
    // MARK: - ViewDidLodad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepare()
        setupNaviBar()
    }
    
    private func prepare() {
        guard let price = self.price else { return }
        contentView.lastLabel.text = "\(price)원"
    }
    
    private func setupNaviBar() {
        title = "장바구니"
    }
    
    
}
