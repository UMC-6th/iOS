//
//  MainView.swift
//  Week1
//
//  Created by 이승민 on 4/3/24.
//

import UIKit
import SnapKit
import Then

final class MainView: UIView {
    // MARK: - View
    let scrollView = UIScrollView()
    
    let contentView = UIView()
    
    let topView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.4196, green: 0.749, blue: 0.749, alpha: 1.0)
        $0.layer.cornerRadius = 30
        $0.layer.masksToBounds = true
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    let placeLabel = UILabel().then {
        $0.text = "우리집"
        $0.textColor = .white
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
    }
    
    let icon1 = UIImageView().then {
        $0.image = UIImage(systemName: "square.grid.2x2")
        $0.tintColor = .white
    }
    
    let icon2 = UIImageView().then {
        $0.image = UIImage(systemName: "bell")
        $0.tintColor = .white
    }
    
    let icon3 = UIImageView().then {
        $0.image = UIImage(systemName: "cart")
        $0.tintColor = .white
    }
    
    let stackView1 = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.distribution = .fillEqually
    }
    
    let customSearchBar = CustomSearchBar()
    
    let cuponButton = UIButton().then {
        $0.setImage(UIImage(named: "img_cuponbutton"), for: .normal)
//        $0.setTitle("집콕러세요? 30% 쿠폰 드려요!", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.purple.cgColor
    }
    
    let frugalDeliveryButton = UIButton().then {
        $0.setImage(UIImage(named: "img_frugalDeliveryButton"), for: .normal)
//        $0.setTitle("알뜰배달", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
    }
    
    let deliveryButton = UIButton().then {
        $0.setImage(UIImage(named: "img_deliveryButton"), for: .normal)
//        $0.setTitle("배달", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
    }
    
    let storeButton = UIButton().then {
        $0.setImage(UIImage(named: "img_storeButton"), for: .normal)
//        $0.setTitle("배민스토어", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
    }
    
    let stackView2 = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 12
        $0.distribution = .fillEqually
    }
    
    let specialOfferButton = UIButton().then {
        $0.setImage(UIImage(named: "img_specialOfferButton"), for: .normal)
//        $0.setTitle("대용량 특가", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
    }
    
    let advertisementButton = UIButton().then {
        $0.setImage(UIImage(named: "img_advertisementButton"), for: .normal)
//        $0.setTitle("광고", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray6
        
        addViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    private func addViews() {
        self.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubviews([
            topView,
            cuponButton,
            stackView2,
            specialOfferButton,
            advertisementButton
        ])
        
        topView.addSubviews([
            placeLabel,
            stackView1,
            customSearchBar,
        ])
        
        stackView1.addArrangedSubviews([
            icon1,
            icon2,
            icon3
        ])
        
        stackView2.addArrangedSubviews([
            frugalDeliveryButton,
            deliveryButton,
            storeButton
        ])
    }
    
    private func configureConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(contentView)
            make.height.equalTo(200)
        }
        
        placeLabel.snp.makeConstraints { make in
            make.top.equalTo(topView).inset(80)
            make.leading.equalTo(topView).inset(20)
        }

        icon1.snp.makeConstraints { make in
            make.size.equalTo(25)
        }
        
        stackView1.snp.makeConstraints { make in
            make.top.equalTo(placeLabel)
            make.trailing.equalTo(topView).inset(20)
        }
        
        customSearchBar.snp.makeConstraints { make in
            make.top.equalTo(placeLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(topView).inset(20)
        }
        
        cuponButton.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(contentView).inset(20)
            make.height.equalTo(50)
        }
        
        frugalDeliveryButton.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        
        stackView2.snp.makeConstraints { make in
            make.top.equalTo(cuponButton.snp.bottom).offset(20)
            make.leading.trailing.equalTo(cuponButton)
        }
        
        specialOfferButton.snp.makeConstraints { make in
            make.top.equalTo(stackView2.snp.bottom).offset(20)
            make.leading.trailing.equalTo(cuponButton)
            make.height.equalTo(150)
        }
        
        advertisementButton.snp.makeConstraints { make in
            make.top.equalTo(specialOfferButton.snp.bottom).offset(20)
            make.leading.trailing.equalTo(cuponButton)
            make.height.equalTo(100)
            make.bottom.equalTo(contentView).inset(30)
        }
    }
}
