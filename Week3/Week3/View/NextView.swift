//
//  NextView.swift
//  Week3
//
//  Created by 이승민 on 4/17/24.
//

import UIKit

final class NextView: UIView {
    // MARK: - View
    let completeButton = UIButton().then {
        $0.backgroundColor = .blue
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
        self.addSubview(completeButton)
    }
    
    private func configureConstraints() {
        completeButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(25)
            make.bottom.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
    }
}
