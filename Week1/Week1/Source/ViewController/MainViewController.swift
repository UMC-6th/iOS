//
//  ViewController.swift
//  Week1
//
//  Created by 이승민 on 4/3/24.
//

import UIKit

final class MainViewController: UIViewController {
    // MARK: - Properties
    private let mainView = MainView()
    
    // MARK: - View 설정
    override func loadView() {
        view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - ViewDidLodad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepare()
    }
    
    private func prepare() {
        
    }
}
