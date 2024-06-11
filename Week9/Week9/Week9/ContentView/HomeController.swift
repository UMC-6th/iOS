//
//  HomeController.swift
//  Week4
//
//  Created by 김승원 on 4/21/24.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - UI Components
    private let HeaderView = AuthHeaderView(image: "errorImage", title: "로그인 성공!", subTitle: "로그인에 성공하셨습니다.")
    
    private let logOutButton = CustomButton(title: "로그아웃", hasBackground: true, fontSize: .big)
    
    private let userLabel: UILabel = {
        let lb = UILabel()
        lb.text = "아이디와 이메일을"
        lb.textColor = .label
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        lb.numberOfLines = 2
        return lb
    }()
    
    private let emailLabel: UILabel = {
        let lb = UILabel()
        lb.text = "불러오는 중입니다."
        lb.textColor = .label
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        lb.numberOfLines = 2
        return lb
    }()
    
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logOutButton.addTarget(self, action: #selector(didTapLogoutButton), for: .touchUpInside)
        
        setupUI()
        setupConstraints()
        
        print("fetching 시작")
        
        AuthService.shared.fetchUser { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showFetchingUserError(on: self, with: error)
                print("error")
                return
            }
            
            if let user = user {
                self.userLabel.text = "\(user.username)"
                self.emailLabel.text = "\(user.email)"
            }
            
        }
        
        print("fetching 끝")
        
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "로그아웃",
//                                                                 style: .plain,
//                                                                 target: self,
//                                                                 action: #selector(didTapLogoutButton))
        
        self.view.addSubview(HeaderView)
        self.view.addSubview(userLabel)
        self.view.addSubview(emailLabel)
        self.view.addSubview(logOutButton)
        
    }
    
    // MARK: - Constraints Setup
    private func setupConstraints() {
        
        HeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        HeaderView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        HeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        HeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        HeaderView.heightAnchor.constraint(equalToConstant: 230).isActive = true
        
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        
        userLabel.topAnchor.constraint(equalTo: HeaderView.bottomAnchor, constant: 40).isActive = true
        userLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        userLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        userLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85).isActive = true
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        emailLabel.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 5).isActive = true
        emailLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        emailLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85).isActive = true
        
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        logOutButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -60).isActive = true
        logOutButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        logOutButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        logOutButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85).isActive = true
        
    }
    
    // MARK: - Selectors
    @objc private func didTapLogoutButton() {
        
        print("didTapLogoutButton Tapped")
        
        AuthService.shared.signOut { [weak self] error in
            guard let self = self else { return }
            
            if let error = error {
                AlertManager.showLogoutError(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
        
    }
}
