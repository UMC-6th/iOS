//
//  ViewController.swift
//  Week1
//
//  Created by 김승원 on 4/8/24.
//

import UIKit

class ViewController: UIViewController {

    
    let mintView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 15.0
        view.layer.masksToBounds = true
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let locationLabel: UILabel = {
        let lb = UILabel()
        lb.text = "우리집"
        lb.textColor = .white
        lb.backgroundColor = .clear
        lb.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        lb.numberOfLines = 1
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let locationButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let cartButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "cart"), for: .normal)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let bellButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "bell"), for: .normal)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let squareButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let mainSearchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "오늘은 피자가 당긴다..!"
        sb.isEnabled = true
        sb.backgroundColor = .white
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.layer.masksToBounds = false
        sb.layer.shadowColor = UIColor.black.cgColor
        sb.layer.shadowOpacity = 0.3
        sb.layer.shadowOffset = CGSize(width: 0, height: 2)
        sb.layer.shadowRadius = 3
        return sb
    }()
    
    let couponButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("iOS 공부하세요? 30% 쿠폰 가져가세요!", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        lb.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.red.cgColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let smallButton1: UIButton = {
        let btn = UIButton()
        btn.setTitle("알뜰배달", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.red.cgColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let smallButton2: UIButton = {
        let btn = UIButton()
        btn.setTitle("배달", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.red.cgColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let smallButton3: UIButton = {
        let btn = UIButton()
        btn.setTitle("배민스토어", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.red.cgColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .equalSpacing
        sv.spacing = 15
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let specialPriceButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("대용량 특가", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.red.cgColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let discountButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("마고피자 특급 할인~!!", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.red.cgColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    // 탭바 여기다가 정의해도 되나?
    private func addTabBar() {
        let tabBarController = customTabBarController()
        addChild(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.didMove(toParent: self)
    }
    
    

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addSubViews()
        configureConstraints()
        
    }
    
    // MARK: - addSubViews
    private func addSubViews() {
        view.backgroundColor = .white
        
        view.addSubview(mintView)
        
        mintView.addSubview(locationLabel)
        mintView.addSubview(locationButton)
        mintView.addSubview(cartButton)
        mintView.addSubview(bellButton)
        mintView.addSubview(squareButton)
        mintView.addSubview(mainSearchBar)
        
        view.addSubview(couponButton)
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(smallButton1)
        mainStackView.addArrangedSubview(smallButton2)
        mainStackView.addArrangedSubview(smallButton3)
        view.addSubview(specialPriceButton)
        view.addSubview(discountButton)
        addTabBar()
        
        
    }
    
    // MARK: - constraints
    private func configureConstraints() {
        mintView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        mintView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        mintView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
//        mintView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        mintView.bottomAnchor.constraint(equalTo: mainSearchBar.bottomAnchor, constant: 15).isActive = true
        
        locationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: mintView.leadingAnchor, constant: 15).isActive = true
        
        locationButton.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor).isActive = true
        locationButton.leadingAnchor.constraint(equalTo: locationLabel.trailingAnchor, constant: 5).isActive = true
        
        cartButton.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor).isActive = true
        cartButton.trailingAnchor.constraint(equalTo: mintView.trailingAnchor, constant: -15).isActive = true
     
        bellButton.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor).isActive = true
        bellButton.trailingAnchor.constraint(equalTo: cartButton.leadingAnchor, constant: -8).isActive = true
        
        squareButton.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor).isActive = true
        squareButton.trailingAnchor.constraint(equalTo: bellButton.leadingAnchor, constant: -10).isActive = true
        
        mainSearchBar.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 15).isActive = true
        mainSearchBar.leadingAnchor.constraint(equalTo: mintView.leadingAnchor, constant: 15).isActive = true
        mainSearchBar.trailingAnchor.constraint(equalTo: mintView.trailingAnchor, constant: 15).isActive = true
        
        couponButton.topAnchor.constraint(equalTo: mintView.bottomAnchor, constant: 15).isActive = true
        couponButton.leadingAnchor.constraint(equalTo: locationLabel.leadingAnchor, constant: 0).isActive = true
        couponButton.trailingAnchor.constraint(equalTo: cartButton.trailingAnchor, constant: 0).isActive = true
        couponButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        mainStackView.topAnchor.constraint(equalTo: couponButton.bottomAnchor, constant: 15).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: locationLabel.leadingAnchor, constant: 0).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: cartButton.trailingAnchor, constant: 0).isActive = true
        
        [smallButton1, smallButton2, smallButton3].map {
            $0.widthAnchor.constraint(equalToConstant: 110).isActive = true
            $0.heightAnchor.constraint(equalTo: $0.widthAnchor, multiplier: 1.0).isActive = true
        }
        
        specialPriceButton.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 15).isActive = true
        specialPriceButton.leadingAnchor.constraint(equalTo: locationLabel.leadingAnchor, constant: 0).isActive = true
        specialPriceButton.trailingAnchor.constraint(equalTo: cartButton.trailingAnchor, constant: 0).isActive = true
        specialPriceButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        discountButton.topAnchor.constraint(equalTo: specialPriceButton.bottomAnchor, constant: 15).isActive = true
        discountButton.leadingAnchor.constraint(equalTo: locationLabel.leadingAnchor, constant: 0).isActive = true
        discountButton.trailingAnchor.constraint(equalTo: cartButton.trailingAnchor, constant: 0).isActive = true
        discountButton.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }


}
