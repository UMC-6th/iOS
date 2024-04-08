//
//  CustomSearchBar.swift
//  Week1
//
//  Created by 이승민 on 4/3/24.
//

import UIKit

final class CustomSearchBar: UIView {
    // MARK: - View
    let baseView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let magnifierIcon = UIImageView().then {
        $0.image = UIImage(systemName: "magnifyingglass")
        $0.tintColor = UIColor(red: 0.4196, green: 0.749, blue: 0.749, alpha: 1.0)
    }
    
    let placeholderLabel = UILabel().then {
        $0.text = "찾는 맛집 이름이 뭐예요?"
        $0.textColor = .lightGray
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        addViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    private func addViews() {
        self.addSubview(baseView)
        
        baseView.addSubviews([
            magnifierIcon,
            placeholderLabel
        ])
    }
    
    private func configureConstraints() {
        baseView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(50)
        }
        
        magnifierIcon.snp.makeConstraints { make in
            make.centerY.equalTo(baseView)
            make.leading.equalTo(15)
            make.size.equalTo(20)
        }
        
        placeholderLabel.snp.makeConstraints { make in
            make.centerY.equalTo(baseView)
            make.leading.equalTo(magnifierIcon.snp.trailing).offset(10)
        }
    }
}
