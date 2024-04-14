//
//  FirstViewController.swift
//  Week3
//
//  Created by 김승원 on 4/14/24.
//

import UIKit

class FirstViewController: UIViewController {
    // MARK: - Properties
    private let contentView = FirstView()
    

    // MARK: - LifeCycle
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

    }
}
