//
//  ViewController.swift
//  UMCweek7
//
//  Created by 이승민 on 11/15/23.
//

import UIKit
import KakaoSDKUser

class ViewController: UIViewController {
    
    var kakaobutton: UIButton = {
        let bt = UIButton()
        // 이미지 설정
        if let image = UIImage(named: "kakao_login_medium_wide") {
            bt.setImage(image, for: .normal)
        }
        bt.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return bt
    }()
    
    var kakaoimage: UIImageView = {
        let im = UIImageView()
        im.backgroundColor = .red
        return im
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setupAutoLayout()
        
    }
    
    
    // MARK: - 초기 설정
    func configure() {
        [kakaobutton, kakaoimage].forEach { view.addSubview($0) }
    }
    
    // MARK: - 오토레이아웃 설정
    func setupAutoLayout() {
        
        // 카카오 로그인 버튼
        kakaobutton.translatesAutoresizingMaskIntoConstraints = false
        kakaobutton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        kakaobutton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // 프사 이미지 뷰
        kakaoimage.translatesAutoresizingMaskIntoConstraints = false
        kakaoimage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        kakaoimage.topAnchor.constraint(equalTo: kakaobutton.bottomAnchor, constant: 16).isActive = true
        kakaoimage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        kakaoimage.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    // MARK: - 로그인 버튼 눌렸을 때
    @objc func buttonTapped() {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                
                //do something
                _ = oauthToken
                
                // 엑세스 토큰
                let accessToken = oauthToken?.accessToken
                
                //카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
                self.setUserInfo()
            }
        }
    }
    
    
    // MARK: - 로그인하면 프사랑 이름 가져와서 보여주기
    func setUserInfo() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                //do something
                _ = user
                //self.infoLabel.text = user?.kakaoAccount?.profile?.nickname
                
                if let url = user?.kakaoAccount?.profile?.profileImageUrl,
                    let data = try? Data(contentsOf: url) {
                    self.kakaoimage.image = UIImage(data: data)
                }
            }
        }
    }
}

