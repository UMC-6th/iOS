//
//  MainViewController.swift
//  Week3
//
//  Created by 이승민 on 4/17/24.
//

import UIKit

final class MainViewController: UIViewController {
    // MARK: - Properties
    private var prices: [Int: Int] = [0: 20000, 1: 23000]
    private lazy var buttons: [UIButton] = [mainView.midiumButton, mainView.largeButton]
    
    private var price: Int = 0
    
    private let mainView = MainView()
    
    // MARK: - View 설정
    override func loadView() {
        view = mainView
    }
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNaviBar()
        setupButton()
    }
    
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
        
        mainView.completeButton.addTarget(self,
                                          action: #selector(completeButtonTapped),
                                          for: .touchUpInside)
    }
}

extension MainViewController {
    // MARK: - Button Actions
    @objc private func buttonTapped(_ sender: UIButton) {
        if let price = prices[sender.tag] {
            self.price = price
            mainView.completeButton.setTitle("\(price)원", for: .normal)
            mainView.completeButton.isEnabled = true // 버튼 활성화
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
        let VC = NextViewController()
        VC.price = self.price
        navigationController?.pushViewController(VC, animated: true)
    }
}
