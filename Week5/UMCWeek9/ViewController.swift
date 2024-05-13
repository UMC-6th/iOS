//
//  ViewController.swift
//  UMCWeek9
//
//  Created by 이승민 on 11/29/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 로또번호 나타내는 label
    private lazy var mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "대기중"
        lb.font = .boldSystemFont(ofSize: 25)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    // MARK: - 텍스트필드
    private lazy var textField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 40
        tf.placeholder = "회차를 입력해주세요!!!"
        tf.borderStyle = .roundedRect
        tf.clearButtonMode = .always
        tf.keyboardType = .numberPad
        tf.layer.borderWidth = 1.0
        tf.layer.cornerRadius = 5.0
        tf.layer.borderColor = UIColor.orange.cgColor
        return tf
    }()
    
    // MARK: - 검색버튼
    private lazy var mainButton: UIButton = {
        let bt = UIButton()
        bt.backgroundColor = .blue
        bt.setTitle("검색", for: .normal)
        bt.layer.cornerRadius = 5.0
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
        return bt
    }()
    
    // MARK: - 텍스트필드와 검색버트 스택뷰에 배치
    private lazy var stackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [textField, mainButton])
        stview.spacing = 15
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    // MARK: - Lotto 구조체
    struct Lotto: Codable {
        let drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6, bnusNo: Int
    }
    
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeUI()
        navigationbarSet()
    }
    
    
    // MARK: - 네이게이션바 설정
    func navigationbarSet() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .darkGray
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        title = "로또 번호 조회"
    }
    
    // MARK: - 오토레이아웃 설정
    func makeUI() {
        view.addSubview(stackView)
        view.addSubview(mainLabel)
        
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            
            mainButton.widthAnchor.constraint(equalToConstant: 80),
            mainButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    // MARK: - 검색 버튼 클릭했을 때
    @objc func mainButtonTapped() {
        if let enteredNum = textField.text, let finalNum = Int(enteredNum) {
            let urlString = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(finalNum)"
            if let url = URL(string: urlString) {
                fetchData(from: url)
            }
        }
    }
    
    
    // MARK: - 에러처리 및 로또번호 나타내기
    func fetchData(from url: URL) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling GET")
                print(error!)
                return
            }
            
            guard let safeData = data else {
                print("Error: Did not receive data")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            
            do {
                let lotto = try JSONDecoder().decode(Lotto.self, from: safeData)
                DispatchQueue.main.async { // 비동기 처리
                    self.mainLabel.text = "\(lotto.drwtNo1), \(lotto.drwtNo2), \(lotto.drwtNo3), \(lotto.drwtNo4), \(lotto.drwtNo5), \(lotto.drwtNo6), Bonus: \(lotto.bnusNo)"
                }
            } catch {
                DispatchQueue.main.async{
                    self.mainLabel.text = "없는 회차입니다! 다시입력해주세요 :)"
                }
            }
        }.resume()
    }
    
    // 텍스트필드 외에 다른 곳 터치하면 키보드 내려가게
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }
}
