//
//  SecondView.swift
//  Week3
//
//  Created by 김승원 on 4/18/24.
//

import UIKit

class SecondView: UIView {
    
    // MARK: - Properties
    let lastLabel: UILabel = {
        let lb = UILabel()
        lb.text = "test"
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupViews() {
        
        self.addSubview(lastLabel)
        
    }
    
    private func setupConstraints() {
        lastLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        lastLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
    }

}
