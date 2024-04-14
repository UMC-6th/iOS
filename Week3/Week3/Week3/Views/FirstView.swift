//
//  FirstView.swift
//  Week3
//
//  Created by 김승원 on 4/14/24.
//

import UIKit

final class FirstView: UIView {

    
     // MARK: - Properties
     let scrollView: UIScrollView = {
         let sv = UIScrollView()
         sv.translatesAutoresizingMaskIntoConstraints = false
         return sv
     }()
     
     let contentView: UIView = {
         let view = UIView()
         view.backgroundColor = .red
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
     
     // 상단 피자 이미지
     let pizzaImageView: UIImageView = {
         let iv = UIImageView(image: UIImage(named: "pizzaImage"))
         iv.contentMode = .scaleAspectFill
         iv.translatesAutoresizingMaskIntoConstraints = false
         return iv
     }()
     
     // 첫 번째 흰 뷰
     let topWhiteView: UIView = {
         let view = UIView()
         view.backgroundColor = .white
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
         
     }()
     
     // MARK: - Initialization
     init() {
         super.init(frame: .zero)
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
         topWhiteView.heightAnchor.constraint(equalToConstant: 160).isActive = true
     }

}
