//
//  ViewController.swift
//  weekOneHw
//
//  Created by 이재용 on 4/4/24.
//

import UIKit // UIKit 프레임워크를 임포트합니다. UI 구성요소를 사용하기 위해 필요합니다.

class ViewController: UIViewController { // ViewController 클래스를 정의합니다. UIViewController를 상속받아 iOS 앱의 뷰 컨트롤러 역할을 합니다.
    
    // MARK: components
    let upperMintView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemMint
        return view
    }()
    
    let myhomeLabel: UILabel = {
        let label = UILabel()
        label.text = "우리집"
        label.textColor = .white
        return label
    }()
    
    let menuButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    let bellButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "bell"), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    let cartButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "cart"), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    let searchBar: UISearchBar = {
       let sb = UISearchBar()
        sb.placeholder = "찾는 맛집 이름이 뭐에요?"
        sb.searchTextField.backgroundColor = .white
        sb.setImage(UIImage(systemName: "magnifyingglass"), for: .search, state: .normal)
        return sb
    }()
    
    let zipcockImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "zipcock")
        img.contentMode = .scaleAspectFit
        return img
    }()
    let alDdleImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "alDdle")
        img.contentMode = .scaleAspectFit
        return img
    }()
    let baedalImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "baeDal")
        img.contentMode = .scaleAspectFit
        return img
    }()
    let storeImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "store")
        img.contentMode = .scaleAspectFit
        return img
    }()
    let daeyongryangImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "daeyongryang")
        img.contentMode = .scaleAspectFit
        return img
    }()
    let templeImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "temple")
        img.contentMode = .scaleAspectFit
        return img
    }()
    let tabbarImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "tabbar")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    override func viewDidLoad() { // 뷰 컨트롤러의 뷰가 메모리에 로드된 후 호출되는 메소드를 오버라이드합니다.
        super.viewDidLoad() // 부모 클래스의 viewDidLoad 메소드를 호출하여 기본 설정을 유지합니다.
        self.view.backgroundColor = .white
        viewStructConfig()
        mintviewALO()
        mintInnerALO()
        homeALO()
        setupBorders()
    }
    func viewStructConfig() {
        self.view.addSubview(upperMintView)
        upperMintView.addSubview(myhomeLabel)
        upperMintView.addSubview(menuButton)
        upperMintView.addSubview(bellButton)
        upperMintView.addSubview(cartButton)
        upperMintView.addSubview(searchBar)
        self.view.addSubview(zipcockImage)
        self.view.addSubview(alDdleImage)
        self.view.addSubview(baedalImage)
        self.view.addSubview(storeImage)
        self.view.addSubview(daeyongryangImage)
        self.view.addSubview(templeImage)
        self.view.addSubview(tabbarImage)
    }
    
    func mintviewALO() {
        upperMintView.translatesAutoresizingMaskIntoConstraints = false
        upperMintView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        upperMintView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        upperMintView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        upperMintView.bottomAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
    }
    func mintInnerALO() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.bottomAnchor.constraint(equalTo: upperMintView.bottomAnchor, constant: -20).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: upperMintView.leadingAnchor, constant: 20).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: upperMintView.trailingAnchor, constant: -20).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        myhomeLabel.translatesAutoresizingMaskIntoConstraints = false
        myhomeLabel.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -10).isActive = true
        myhomeLabel.leadingAnchor.constraint(equalTo: upperMintView.leadingAnchor, constant: 30).isActive = true
        
        cartButton.translatesAutoresizingMaskIntoConstraints = false
        cartButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cartButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        cartButton.trailingAnchor.constraint(equalTo: upperMintView.trailingAnchor, constant: -20).isActive = true
        cartButton.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -10).isActive = true
        
        bellButton.translatesAutoresizingMaskIntoConstraints = false
        bellButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        bellButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        bellButton.trailingAnchor.constraint(equalTo: cartButton.leadingAnchor, constant: -20).isActive = true
        bellButton.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -10).isActive = true
        
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        menuButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        menuButton.trailingAnchor.constraint(equalTo: bellButton.leadingAnchor, constant: -20).isActive = true
        menuButton.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -10).isActive = true
        
    }
    func setupBorders() {
        // zipcockImage 테두리 설정 - 빨간색
        zipcockImage.layer.borderWidth = 1.0
        zipcockImage.layer.borderColor = UIColor.red.cgColor
        
        // alDdleImage 테두리 설정 - 파란색
        alDdleImage.layer.borderWidth = 1.0
        alDdleImage.layer.borderColor = UIColor.blue.cgColor
        
        // baedalImage 테두리 설정 - 초록색
        baedalImage.layer.borderWidth = 1.0
        baedalImage.layer.borderColor = UIColor.green.cgColor
        
        // storeImage 테두리 설정 - 오렌지색
        storeImage.layer.borderWidth = 1.0
        storeImage.layer.borderColor = UIColor.orange.cgColor
        
        // daeyongryangImage 테두리 설정 - 보라색
        daeyongryangImage.layer.borderWidth = 1.0
        daeyongryangImage.layer.borderColor = UIColor.purple.cgColor
        
        // templeImage 테두리 설정 - 黃色
        templeImage.layer.borderWidth = 1.0
        templeImage.layer.borderColor = UIColor.yellow.cgColor
        
        // tabbarImage 테두리 설정 - 검정색
        tabbarImage.layer.borderWidth = 1.0
        tabbarImage.layer.borderColor = UIColor.black.cgColor
    }

    func homeALO() {
        zipcockImage.translatesAutoresizingMaskIntoConstraints = false
        zipcockImage.topAnchor.constraint(equalTo: upperMintView.bottomAnchor, constant: 20).isActive = true
        zipcockImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        zipcockImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        zipcockImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        
        alDdleImage.translatesAutoresizingMaskIntoConstraints = false
        alDdleImage.topAnchor.constraint(equalTo: zipcockImage.bottomAnchor, constant: 20).isActive = true
        alDdleImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        alDdleImage.trailingAnchor.constraint(equalTo: baedalImage.leadingAnchor, constant: -10).isActive = true
        alDdleImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        baedalImage.translatesAutoresizingMaskIntoConstraints = false
        baedalImage.topAnchor.constraint(equalTo: zipcockImage.bottomAnchor, constant: 20).isActive = true
        baedalImage.widthAnchor.constraint(equalTo: alDdleImage.widthAnchor).isActive = true
        baedalImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        baedalImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        storeImage.translatesAutoresizingMaskIntoConstraints = false
        storeImage.topAnchor.constraint(equalTo: zipcockImage.bottomAnchor, constant: 20).isActive = true
        storeImage.leadingAnchor.constraint(equalTo: baedalImage.trailingAnchor, constant: 10).isActive = true
        storeImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        storeImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        daeyongryangImage.translatesAutoresizingMaskIntoConstraints = false
        daeyongryangImage.topAnchor.constraint(equalTo: baedalImage.bottomAnchor, constant: 20).isActive = true
        daeyongryangImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        daeyongryangImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        daeyongryangImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        templeImage.translatesAutoresizingMaskIntoConstraints = false
        templeImage.topAnchor.constraint(equalTo: daeyongryangImage.bottomAnchor, constant: 20).isActive = true
        templeImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        templeImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        templeImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        tabbarImage.translatesAutoresizingMaskIntoConstraints = false
        tabbarImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        tabbarImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        tabbarImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        tabbarImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
    }
}

