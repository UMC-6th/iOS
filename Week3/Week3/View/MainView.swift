//
//  MainView.swift
//  Week3
//
//  Created by 이승민 on 4/17/24.
//

import UIKit
import SnapKit
import Then

final class MainView: UIView {
    // MARK: - View
    private let foodImage = UIImageView().then {
        $0.image = UIImage(named: "pizza")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let foodNameLabel = UILabel().then {
        $0.text = "[재주문 1위] 바싹불고기피자"
        $0.font = .boldSystemFont(ofSize: 25)
    }
    
    private let foodDescriptionLabel = UILabel().then {
        $0.text = "바싹 익힌 불고기의 풍미를 입안 가득 느낄 수 있는 자가제빵선명희피자의 야심작"
        $0.textColor = .lightGray
        $0.numberOfLines = 0
    }
    
    private let dividerView = UIView().then {
        $0.backgroundColor = .systemGray4
    }
    
    private let priceLabel = UILabel().then {
        $0.text = "가격"
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    let midiumButton = UIButton().then {
        $0.setImage(UIImage(systemName: "circle"), for: .normal)
        $0.tag = 0 // 태그 지정
    }
    
    private let midiumLabel = UILabel().then {
        $0.text = "M                                  20,000원"
    }
    
    private let midiumStackView = UIStackView().then {
        $0.spacing = 3
        $0.axis = .horizontal
    }
    
    let largeButton = UIButton().then {
        $0.setImage(UIImage(systemName: "circle"), for: .normal)
        $0.tag = 1 // 태그 지정
    }
    
    private let largeLabel = UILabel().then {
        $0.text = "L                                   23,000원"
    }
    
    private let largeStackView = UIStackView().then {
        $0.spacing = 3
        $0.axis = .horizontal
    }
    
    let completeButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.setTitle("0원", for: .normal)
        $0.isEnabled = false // 버튼 비활성화
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
        self.addSubview(foodImage)
        self.addSubview(foodNameLabel)
        self.addSubview(foodDescriptionLabel)
        self.addSubview(dividerView)
        
        self.addSubview(priceLabel)
        self.addSubview(midiumStackView)
        self.addSubview(largeStackView)
        
        self.addSubview(completeButton)
        
        midiumStackView.addArrangedSubview(midiumButton)
        midiumStackView.addArrangedSubview(midiumLabel)
        
        largeStackView.addArrangedSubview(largeButton)
        largeStackView.addArrangedSubview(largeLabel)
    }
    
    private func configureConstraints() {
        foodImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(250)
        }
        
        foodNameLabel.snp.makeConstraints { make in
            make.top.equalTo(foodImage.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        foodDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(foodNameLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(foodNameLabel)
        }
        
        dividerView.snp.makeConstraints { make in
            make.top.equalTo(foodDescriptionLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(15)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(dividerView.snp.bottom).offset(15)
            make.leading.trailing.equalTo(foodNameLabel)
        }
        
        midiumStackView.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(20)
            make.leading.equalTo(priceLabel)
        }
        
        largeStackView.snp.makeConstraints { make in
            make.top.equalTo(midiumStackView.snp.bottom).offset(20)
            make.leading.equalTo(priceLabel)
        }
        
        completeButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(40)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
    }
}
