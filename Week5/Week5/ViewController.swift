//
//  ViewController.swift
//  Week5
//
//  Created by 김승원 on 5/8/24.
//

import UIKit
import Combine

class ViewController: UIViewController {
    // MARK: - Variables
    lazy var kakaoAuthViewModel: KakaoAuthViewModel = { KakaoAuthViewModel() }()
    
    var subscriptions = Set<AnyCancellable>()
    
    // MARK: - UI Components
    private var ImageView1: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "Image1"))
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private var ImageView2: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "Image2"))
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private var kakaoLoginStatusLabel: UILabel = {
        let lb = UILabel()
        lb.text = "..."
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private var kakaoLoginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("카카오 로그인", for: .normal)
        btn.configuration = .filled()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private var kakaoLogoutButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("카카오톡 로그아웃", for: .normal)
        btn.configuration = .filled()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private var apiButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("공공API", for: .normal)
        btn.configuration = .filled()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // button Add Target
        kakaoLoginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        kakaoLogoutButton.addTarget(self, action: #selector(didTapLogoutButton), for: .touchUpInside)
        apiButton.addTarget(self, action: #selector(didTapApiButton), for: .touchUpInside)
        
        
        setupUI()
        setBindings()
        
    }
    
    // MARK: - Button Actions
    @objc func didTapLoginButton() {
        print("Login Button Tapped")
        kakaoAuthViewModel.kakaoLogin()
    }
    
    @objc func didTapLogoutButton() {
        print("Logout Button Tapped")
        kakaoAuthViewModel.kakaoLogout()
    }
    
    @objc func didTapApiButton() {
        print("API Button Tapped")
        let viewController = SecondViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Set up UI
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(ImageView1)
        self.view.addSubview(ImageView2)
        self.view.addSubview(kakaoLoginStatusLabel)
        self.view.addSubview(kakaoLoginButton)
        self.view.addSubview(kakaoLogoutButton)
        self.view.addSubview(apiButton)
        
        setupConstraints()
    }
    
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        
        ImageView1.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 100).isActive = true
        ImageView1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        ImageView1.widthAnchor.constraint(equalToConstant: 150).isActive = true
        ImageView1.heightAnchor.constraint(equalTo: ImageView1.widthAnchor, multiplier: 1.0).isActive = true
        
        ImageView2.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 30).isActive = true
        ImageView2.centerXAnchor.constraint(equalTo: self.ImageView1.centerXAnchor, constant: 105).isActive = true
        ImageView2.widthAnchor.constraint(equalToConstant: 120).isActive = true
        ImageView2.heightAnchor.constraint(equalTo: ImageView2.widthAnchor, multiplier: 1.0).isActive = true
        
        kakaoLoginStatusLabel.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        kakaoLoginStatusLabel.centerXAnchor.constraint(equalTo: self.ImageView2.centerXAnchor, constant: 0).isActive = true
        kakaoLoginStatusLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        kakaoLoginStatusLabel.heightAnchor.constraint(equalTo: ImageView2.widthAnchor, multiplier: 1.0).isActive = true
        
        kakaoLoginButton.topAnchor.constraint(equalTo: self.ImageView1.bottomAnchor, constant: 30).isActive = true
        kakaoLoginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        kakaoLoginButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        kakaoLoginButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        kakaoLogoutButton.topAnchor.constraint(equalTo: self.kakaoLoginButton.bottomAnchor, constant: 10).isActive = true
        kakaoLogoutButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        kakaoLogoutButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        kakaoLogoutButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        apiButton.topAnchor.constraint(equalTo: self.kakaoLogoutButton.bottomAnchor, constant: 10).isActive = true
        apiButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        apiButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        apiButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        
        
        
    }
}

extension ViewController {
    fileprivate func setBindings() {
        self.kakaoAuthViewModel.$isLoggedIn.sink { [weak self]isLoggedIn in
            guard let self = self else { return }
            self.kakaoLoginStatusLabel.text = isLoggedIn ? "🫧" : "로그인 하세요!"
            
        }
        .store(in: &subscriptions)
    }
}

