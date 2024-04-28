//
//  LoginController.swift
//  Week4
//
//  Created by 김승원 on 4/21/24.
//

import UIKit

class LoginController: UIViewController {

    // MARK: - UIComponents
    
    private let headerView = AuthHeaderView(image:"logoImage", title: "로그인", subTitle: "본인의 계정으로 로그인하세요")
    
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    
    private let signInButton = CustomButton(title: "로그인", hasBackground: true, fontSize: .big)
    private let newUserButton = CustomButton(title: "계정이 없으신가요? 가입하기.", fontSize: .med)
    private let forgotPasswordButton = CustomButton(title: "비밀번호 재설정", fontSize: .small)
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.SetupUI()
        self.SetupConstraints()
        
        self.signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        self.newUserButton.addTarget(self, action: #selector(didTapNewUserButton), for: .touchUpInside)
        self.forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPasswordButton), for: .touchUpInside)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
//        AlertManager.showInvalidEmailAlert(on: self)
//        self.didTapNewUserButton()
    }
    
    // MARK: - UISetUp
    private func SetupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerView)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        
        self.view.addSubview(signInButton)
        self.view.addSubview(newUserButton)
        self.view.addSubview(forgotPasswordButton)
    }
    
    // MARK: - ConstraintsSetUp
    private func SetupConstraints() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        
        emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 14).isActive = true
        emailField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        emailField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85).isActive = true
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 16).isActive = true
        passwordField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        passwordField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85).isActive = true
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16).isActive = true
        signInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        signInButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85).isActive = true
        
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        
        newUserButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 12).isActive = true
        newUserButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        newUserButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        newUserButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85).isActive = true

        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        forgotPasswordButton.topAnchor.constraint(equalTo: newUserButton.bottomAnchor, constant: 6).isActive = true
        forgotPasswordButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        forgotPasswordButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        forgotPasswordButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85).isActive = true
        
    }
    
    // MARK: - Selectors
    @objc private func didTapSignInButton() { // 로그인 버튼 탭
        print("didTapSignInButton Tapped")
        let loginRequest = LoginUserRequest(email: self.emailField.text ?? "",
                                            password: self.passwordField.text ?? "")
        
        // 이메일 유효성 검사
        if !Validator.isValidEmail(for: loginRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        // 비밀번호 유효성 검사
        if !Validator.isPasswordValid(for: loginRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        AuthService.shared.signIn(with: loginRequest) { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showSignInErrorAlert(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
        
    }
    
    @objc private func didTapNewUserButton() { // 가입하기 버튼 탭
        print("didTapNewUserButton Tapped")
        let vc = RegisterController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapForgotPasswordButton() { // 비밀번호 찾기 탭
        print("didTapForgotPasswordButton Tapped")
        let vc = ForgotPasswordController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
