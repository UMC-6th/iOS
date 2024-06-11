//
//  WebViewerController.swift
//  Week4
//
//  Created by 김승원 on 4/22/24.
//

import UIKit
import WebKit

class WebViewerController: UIViewController {
    // MARK: - UIComponents
    
    private let webView = WKWebView()

    private let urlString: String
    
    // MARK: - LifeCycle
    init(with urlString: String) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: self.urlString) else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        self.webView.load(URLRequest(url: url))
        
        setupUI()
        setupConstraints()
        
    }
    
    // MARK: - UISetUp
    private func setupUI() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done",
                                                                  style: .done,
                                                                  target: self,
                                                                  action: #selector(didTapDoneButton))
        self.navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        self.view.addSubview(webView)
    }
    
    // MARK: - ConstraintsSetUp
    private func setupConstraints() {
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        webView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
    }
    
    // MARK: - Selectors
    @objc private func didTapDoneButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
