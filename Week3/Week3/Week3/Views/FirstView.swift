//
//  FirstView.swift
//  Week3
//
//  Created by 김승원 on 4/14/24.
//

import UIKit

final class FirstView: UIView {

    
     // MARK: - Properties
     private let scrollView: UIScrollView = {
         let sv = UIScrollView()
         sv.translatesAutoresizingMaskIntoConstraints = false
         return sv
     }()
     
    private let contentView: UIView = {
         let view = UIView()
         view.backgroundColor = .systemGray6
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
     
     // 상단 피자 이미지
    private let pizzaImageView: UIImageView = {
         let iv = UIImageView(image: UIImage(named: "pizzaImage"))
         iv.contentMode = .scaleAspectFill
         iv.translatesAutoresizingMaskIntoConstraints = false
         return iv
     }()
     
     // 첫 번째 흰 뷰
    private let topWhiteView: UIView = {
         let view = UIView()
         view.backgroundColor = .white
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
         
     }()
    
    private let nameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "[재주문1위] 환상의 콤비네이션"
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private let informationLabel: UILabel = {
        let lb = UILabel()
        lb.text = "여러가지 토핑을 한번에 맛볼 수 있는 자기제빵김승원피자의 야심작"
        lb.numberOfLines = 2
        lb.textColor = .gray
        lb.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private let allergyButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("영양성분 및 알레르기성분 표시 보기", for: .normal)
        btn.setTitleColor(.darkGray, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .thin)
        btn.backgroundColor = .systemGray6
        btn.layer.cornerRadius = 8
        btn.layer.masksToBounds = true
        btn.contentEdgeInsets = UIEdgeInsets(top: 2, left: 10, bottom: 2, right: 10)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let firstStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .leading
        sv.spacing = 15
//        sv.backgroundColor = .blue
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    // 두 번째 흰 뷰
    private let secondWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let priceLabel: UILabel = {
        let lb = UILabel()
        lb.text = "가격"
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
        // 버튼 1
    let firstButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "circle"), for: .normal)
        btn.tag = 0
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let firstButtonLabel: UILabel = {
        let lb = UILabel()
        lb.text = "M"
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private let firstButtonPrice: UILabel = {
        let lb = UILabel()
        lb.text = "20,000원"
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
        // 버튼 2
    let secondButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "circle"), for: .normal)
        btn.tag = 1
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let secondButtonLabel: UILabel = {
        let lb = UILabel()
        lb.text = "L"
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private let secondButtonPrice: UILabel = {
        let lb = UILabel()
        lb.text = "25,000원"
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    // 맨 아래 흰 뷰
    private let lastWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let minimumPriceLabel: UILabel = {
        let lb = UILabel()
        lb.text = "최소주문금액"
        lb.textColor = .lightGray
        lb.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private let minimunPriceAmount: UILabel = {
        let lb = UILabel()
        lb.text = "17,000원"
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let completeButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("0원", for: .normal)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = true
        btn.isEnabled = false
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
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
         // 스크롤뷰
         addSubview(scrollView)
         scrollView.addSubview(contentView)
         
         // 상단 피자 뷰
         contentView.addSubview(pizzaImageView)
         
         // 첫 번째 흰 뷰
         contentView.addSubview(topWhiteView)
         
         firstStackView.addArrangedSubview(nameLabel)
         firstStackView.addArrangedSubview(informationLabel)
         firstStackView.addArrangedSubview(allergyButton)
         
         topWhiteView.addSubview(firstStackView)
         
         // 두 번째 흰 뷰
         contentView.addSubview(secondWhiteView)
         
         secondWhiteView.addSubview(priceLabel)
         secondWhiteView.addSubview(firstButton)
         secondWhiteView.addSubview(firstButtonLabel)
         secondWhiteView.addSubview(firstButtonPrice)
         secondWhiteView.addSubview(secondButton)
         secondWhiteView.addSubview(secondButtonLabel)
         secondWhiteView.addSubview(secondButtonPrice)
         
         
         // 맨 아래 흰 뷰
         addSubview(lastWhiteView)
         lastWhiteView.addSubview(minimumPriceLabel)
         lastWhiteView.addSubview(minimunPriceAmount)
         lastWhiteView.addSubview(completeButton)

         
         
     }
     
     private func setupConstraints() {
         // 스크롤 뷰
         scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
         scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
         scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
         scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
         
         contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
         contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
         contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
         contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
         contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
         contentView.heightAnchor.constraint(equalToConstant: 1600).isActive = true
         
         // 상단 피자 이미지 뷰
         pizzaImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
         pizzaImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
         pizzaImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
         pizzaImageView.heightAnchor.constraint(equalToConstant: 255).isActive = true
         
         // 첫 번째 흰 뷰
         topWhiteView.topAnchor.constraint(equalTo: pizzaImageView.bottomAnchor, constant: 0).isActive = true
         topWhiteView.leadingAnchor.constraint(equalTo: pizzaImageView.leadingAnchor, constant: 0).isActive = true
         topWhiteView.trailingAnchor.constraint(equalTo: pizzaImageView.trailingAnchor, constant: 0).isActive = true
         topWhiteView.heightAnchor.constraint(equalToConstant: 150).isActive = true
         
         firstStackView.centerYAnchor.constraint(equalTo: topWhiteView.centerYAnchor).isActive = true
         firstStackView.leadingAnchor.constraint(equalTo: topWhiteView.leadingAnchor, constant: 15).isActive = true
         firstStackView.trailingAnchor.constraint(equalTo: topWhiteView.trailingAnchor, constant: -15).isActive = true
         
         // 두 번째 흰 뷰
         secondWhiteView.topAnchor.constraint(equalTo: topWhiteView.bottomAnchor, constant: 10).isActive = true
         secondWhiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
         secondWhiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
         secondWhiteView.heightAnchor.constraint(equalToConstant: 155).isActive = true
         
         priceLabel.topAnchor.constraint(equalTo: secondWhiteView.topAnchor, constant: 15).isActive = true
         priceLabel.leadingAnchor.constraint(equalTo: firstStackView.leadingAnchor, constant: 0).isActive = true
         
         // 첫 번째 버튼
         firstButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20).isActive = true
         firstButton.leadingAnchor.constraint(equalTo: firstStackView.leadingAnchor, constant: 0).isActive = true
         
         firstButtonLabel.centerYAnchor.constraint(equalTo: firstButton.centerYAnchor, constant: 0).isActive = true
         firstButtonLabel.leadingAnchor.constraint(equalTo: firstButton.trailingAnchor, constant: 5).isActive = true
         
         firstButtonPrice.centerYAnchor.constraint(equalTo: firstButton.centerYAnchor, constant: 0).isActive = true
         firstButtonPrice.trailingAnchor.constraint(equalTo: firstStackView.trailingAnchor, constant: 0).isActive = true
         
         // 두 번째 버튼
         secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 30).isActive = true
         secondButton.leadingAnchor.constraint(equalTo: firstStackView.leadingAnchor, constant: 0).isActive = true
         
         secondButtonLabel.centerYAnchor.constraint(equalTo: secondButton.centerYAnchor, constant: 0).isActive = true
         secondButtonLabel.leadingAnchor.constraint(equalTo: secondButton.trailingAnchor, constant: 5).isActive = true
         
         secondButtonPrice.centerYAnchor.constraint(equalTo: secondButton.centerYAnchor, constant: 0).isActive = true
         secondButtonPrice.trailingAnchor.constraint(equalTo: firstStackView.trailingAnchor, constant: 0).isActive = true
         
         // 맨 아래 흰 뷰
         lastWhiteView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
         lastWhiteView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
         lastWhiteView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
         lastWhiteView.heightAnchor.constraint(equalToConstant: 90).isActive = true
         
         minimumPriceLabel.topAnchor.constraint(equalTo: lastWhiteView.topAnchor, constant: 10).isActive = true
         minimumPriceLabel.leadingAnchor.constraint(equalTo: firstStackView.leadingAnchor, constant: 0).isActive = true
         minimumPriceLabel.widthAnchor.constraint(equalToConstant: 63).isActive = true
         
         minimunPriceAmount.topAnchor.constraint(equalTo: minimumPriceLabel.bottomAnchor, constant: 7).isActive = true
         minimunPriceAmount.leadingAnchor.constraint(equalTo: firstStackView.leadingAnchor, constant: 0).isActive = true
         
         completeButton.leadingAnchor.constraint(equalTo: minimumPriceLabel.trailingAnchor, constant: 10).isActive = true
         completeButton.topAnchor.constraint(equalTo: minimumPriceLabel.topAnchor, constant: 0).isActive = true
         completeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
         completeButton.bottomAnchor.constraint(equalTo: minimunPriceAmount.bottomAnchor, constant: 0).isActive = true

         
         
         
     }

}
