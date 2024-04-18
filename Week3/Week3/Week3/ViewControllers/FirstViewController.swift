//
//  FirstViewController.swift
//  Week3
//
//  Created by 김승원 on 4/14/24.
//

import UIKit

class FirstViewController: UIViewController {
    // MARK: - Properties
    
    private var prices: [Int: Int] = [0: 20000, 1: 25000]
    private lazy var buttons: [UIButton] = [contentView.firstButton, contentView.secondButton]
    
    private var price: Int = 0
    
    private let contentView = FirstView()
    

    // MARK: - LifeCycle
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupNaviBar()
        setupButton()
    }
    
    // 네비 바
    private func setupNaviBar() {
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
    }
    
    private func setupButton() {
        buttons.forEach {
            $0.addTarget(self,
                         action: #selector(buttonTapped(_:)),
                         for: .touchUpInside)
        }
        
        contentView.completeButton.addTarget(self,
                                          action: #selector(completeButtonTapped),
                                          for: .touchUpInside)
    }
}

extension FirstViewController {
    // MARK: - Button Actions
    @objc private func buttonTapped(_ sender: UIButton) {
        if let price = prices[sender.tag] {
            self.price = price
            contentView.completeButton.setTitle("\(price)원", for: .normal)
            contentView.completeButton.isEnabled = true // 버튼 활성화
            print("dk")
        } else {
            print("가격을 찾을 수 없습니다.")
        }
        
        buttons.forEach {
            if $0.tag == sender.tag {
                $0.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            } else {
                $0.setImage(UIImage(systemName: "circle"), for: .normal)
            }
        }
    }
    
    @objc private func completeButtonTapped() {
        let VC = SecondViewController()
        VC.price = self.price
        navigationController?.pushViewController(VC, animated: true)
    }
}
