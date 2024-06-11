//
//  ForgotPasswordController.swift
//  Week4
//
//  Created by 김승원 on 4/21/24.
//

import UIKit

class ForgotPasswordController: UIViewController {
    
    // MARK: - Variables
    
    // MARK: - UI Components
    private let headerView = AuthHeaderView(image: "thirdLogoImage", title: "비밀번호 재설정", subTitle: "새로운 비밀번호를 설정하세요.")
    
    private let emailFIeld = CustomTextField(fieldType: .email)
    private let resetPasswordButton = CustomButton(title: "재설정", hasBackground: true, fontSize: .big)
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetupUI()
        SetupConstraints()
        
        self.resetPasswordButton.addTarget(self, action: #selector(didTapForgotPasswordButton), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
//        self.navigationController?.navigationBar.backgroundColor = .systemGray
    }
    
    // MARK: - UI Setup
    private func SetupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerView)
        self.view.addSubview(emailFIeld)
        self.view.addSubview(resetPasswordButton)
        
    }
    
    // MARK: - Constraints Setup
    private func SetupConstraints() {
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 230).isActive = true
        
        emailFIeld.translatesAutoresizingMaskIntoConstraints = false
        
        emailFIeld.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 11).isActive = true
        emailFIeld.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        emailFIeld.heightAnchor.constraint(equalToConstant: 45).isActive = true
        emailFIeld.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85).isActive = true
        
        resetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        resetPasswordButton.topAnchor.constraint(equalTo: emailFIeld.bottomAnchor, constant: 11).isActive = true
        resetPasswordButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        resetPasswordButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        resetPasswordButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85).isActive = true
        
        
    }
    
    // MARK: - Selectors
    @objc private func didTapForgotPasswordButton() {
        let email = self.emailFIeld.text ?? ""
        
        if !Validator.isValidEmail(for: email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        AuthService.shared.forgotPassword(with: email) { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showErrorSendingPasswordReset(on: self, with: error)
                return
            }
            
            AlertManager.showPasswordResetSent(on: self)
        }
        // TODO: - Email Validation
        
    }
    
}
