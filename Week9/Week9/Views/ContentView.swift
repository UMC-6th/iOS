//
//  ContentView.swift
//  Week9
//
//  Created by 김승원 on 6/11/24.
//

import SwiftUI

class AuthHeaderView: UIView {

    // MARK: - Variables
    
    // MARK: - UIComponents
    private let logoImageView: UIImageView = {
//        let iv = UIImageView(image: UIImage(named: "logoImage"))
        let iv = UIImageView()
        iv.image = UIImage(named: "errorImage")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Error"
        lb.textColor = .label
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return lb
    }()
    
    private let subTitleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Error"
        lb.textColor = .secondaryLabel
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return lb
    }()
    
    // MARK: - LifeCycle
    init(image: String = "errorImage", title: String, subTitle: String) {
        super.init(frame: .zero)
        self.logoImageView.image = UIImage(named: image)
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
        
        SetupUI()
        SetupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UISetUp
    private func SetupUI() {
        
        self.addSubview(logoImageView)
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        
    }
    
    // MARK: - ConstraintsSetUp
    private func SetupConstraint() {
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 1.0).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 19).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        subTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    }

}

class CustomButton: UIButton {

    enum FontSize {
        case big
        case med
        case small
    }
    
    init(title: String, hasBackground: Bool = false, fontSize: FontSize) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
        self.backgroundColor = hasBackground ? .systemBlue : .clear // 배경이 있으면 글자색 없, 배경이 있으면 글자색 있
        
        let titleColor: UIColor = hasBackground ? .white : .systemBlue
        self.setTitleColor(titleColor, for: .normal)
        
        switch fontSize {
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        case .med:
            self.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
