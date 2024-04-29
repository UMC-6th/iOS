//
//  RegisterController.swift
//  Week4
//
//  Created by 김승원 on 4/21/24.
//

import UIKit

class RegisterController: UIViewController {
    
    // MARK: - UIComponents
    
    private let headerView = AuthHeaderView(image: "secondLogoImage", title: "회원가입", subTitle: "새 계정 만들기")
    
    private let usernameField = CustomTextField(fieldType: .username)
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    
    private let signUpButton = CustomButton(title: "가입하기", hasBackground: true, fontSize: .big)
    private let signInButton = CustomButton(title: "이미 계정이 있으신가요? 로그인하기.", fontSize: .med)
    
    private let termsTextView: UITextView = {
        // 중간에 링크
        let attributedString = NSMutableAttributedString(string: "By creating an account, you agree to our Terms & Conditions and you acknowledge that you have read our Privacy Policy")
        
        attributedString.addAttribute(.link,
                                      value: "terms://termsAndConditions", // 찐 주소 아님
                                      range: (attributedString.string as NSString).range(of: "Terms & Conditions"))
        
        attributedString.addAttribute(.link,
                                      value: "privacy://privacyPolicy", // 찐 주소 아님
                                      range: (attributedString.string as NSString).range(of: "Privacy Policy"))
        
        let tv = UITextView()
        tv.linkTextAttributes = [.foregroundColor: UIColor.systemBlue]
        tv.backgroundColor = .clear
        tv.attributedText = attributedString
        tv.textColor = .label
        tv.isSelectable = true
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.delaysContentTouches = false
        return tv
    }()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.termsTextView.delegate = self
        
        self.SetupUI()
        self.SetupConstraints()
        
        self.signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        self.signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
        
    }
    
    // MARK: - UISetUp
    private func SetupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        
        self.view.addSubview(signUpButton)
        self.view.addSubview(termsTextView)
        self.view.addSubview(signInButton)
    }
    
    // MARK: - ConstraintsSetUp
    private func SetupConstraints() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        
        usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 14).isActive = true
        usernameField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        usernameField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        usernameField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85).isActive = true
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        
        emailField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 16).isActive = true
        emailField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        emailField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85).isActive = true
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 16).isActive = true
        passwordField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        passwordField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85).isActive = true
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        // need
        signUpButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16).isActive = true
        signUpButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        signUpButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85).isActive = true
        
        termsTextView.translatesAutoresizingMaskIntoConstraints = false
        // need
        termsTextView.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 6).isActive = true
        termsTextView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        termsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.topAnchor.constraint(equalTo: termsTextView.bottomAnchor, constant: 5).isActive = true
        signInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        signInButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85).isActive = true
        
        
        
    }
    
    // MARK: - Selectors
    @objc private func didTapSignUpButton() {
        print("didTapSignUpButton Tapped")
        let registerUserRequest = RegisterUserRequest(username: self.usernameField.text ?? "",
                                                      email: self.emailField.text ?? "",
                                                      password: self.passwordField.text ?? "")
        
        // 사용자 이름 유효성 검사
        if !Validator.isValidUsername(for: registerUserRequest.username) {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        
        // 이메일 유효성 검사
        if !Validator.isValidEmail(for: registerUserRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        // 비밀번호 유효성 검사
        if !Validator.isPasswordValid(for: registerUserRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        print(registerUserRequest)
        AuthService.shared.registerUser(with: registerUserRequest) { [weak self] wasRegistered, error in
            guard let self = self else { return }
            
            if let error = error {
                AlertManager.showRegistrationErrorAlert(on: self, with: error)
                return
            }
            
            if wasRegistered {
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.checkAuthentication()
                }
            } else {
                AlertManager.showRegistrationErrorAlert(on: self)
            }
        }
    }
    
    @objc private func didTapSignInButton() { // 로그인 버튼 탭
        self.navigationController?.popToRootViewController(animated: true)
    }

}

extension RegisterController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        if URL.scheme == "terms" {
            self.showWebViewerController(with: "https://www.google.co.kr")
        } else if URL.scheme == "privacy" {
            self.showWebViewerController(with: "https://www.youtube.com")
        }
        
        return true
    }
    
    private func showWebViewerController(with urlString: String) {
        let vc = WebViewerController(with: urlString)
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        textView.delegate = nil
        textView.selectedTextRange = nil
        textView.delegate = self
    }
    
    
}
