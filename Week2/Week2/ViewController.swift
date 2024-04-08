//
//  ViewController.swift
//  Week2
//
//  Created by 김승원 on 4/8/24.
//

import UIKit

let cellID = "Cell"

class ViewController: UIViewController{
    
    // MARK: - Properites
    
    //Views
    let topWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "광명동"
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        btn.tintColor = .black
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let bellButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "bell"), for: .normal)
        btn.tintColor = .black
//        btn.contentMode = .scaleAspectFill
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let searchButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        btn.tintColor = .black
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let menuButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        btn.tintColor = .black
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    // scrollView
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .blue
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    // collectionView
    let mainCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        flowLayout.scrollDirection = .horizontal // 이거 왜 반대로??
        cv.backgroundColor = .yellow
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
   
    

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        
        view.backgroundColor = .red
        
        addSubViews()
        configureConstraints()
    }
    
    // MARK: - addSubViews
    private func addSubViews() {
        
        view.addSubview(topWhiteView)
        
        topWhiteView.addSubview(locationLabel)
        topWhiteView.addSubview(locationButton)
        topWhiteView.addSubview(bellButton)
        topWhiteView.addSubview(searchButton)
        topWhiteView.addSubview(menuButton)
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(mainCollectionView)
//        view.addSubview(mainCollectionView)
        mainCollectionView.register(mainCell.self, forCellWithReuseIdentifier: cellID)
    
        
    }
    
    // MARK: - Constraint
    private func configureConstraints() {

        // 상단 흰 뷰
        topWhiteView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        topWhiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        topWhiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
//        topWhiteView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        topWhiteView.bottomAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 15).isActive = true
        
        // 위치 라벨
        locationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: topWhiteView.leadingAnchor, constant: 15).isActive = true
        
        // 위치 라벨 옆 화살표 버튼
        locationButton.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor, constant: 0).isActive = true
        locationButton.leadingAnchor.constraint(equalTo: locationLabel.trailingAnchor, constant: 8).isActive = true
        
        // 종 버튼
        bellButton.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor, constant: 0).isActive = true
        bellButton.trailingAnchor.constraint(equalTo: topWhiteView.trailingAnchor, constant: -15).isActive = true
//        bellButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        bellButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        // 돋보기 버튼
        searchButton.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor, constant: 0).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: bellButton.leadingAnchor, constant: -8).isActive = true
        
        // 햄버거 버튼
        menuButton.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor, constant: 0).isActive = true
        menuButton.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -8).isActive = true
        
        // 스크롤 뷰
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topWhiteView.bottomAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 2.0),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
//        scrollView.topAnchor.constraint(equalTo: topWhiteView.bottomAnchor, constant: 0).isActive = true
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//        
//        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
//        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
//        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
//        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
//        contentView.widthAnchor.constraint(equalToConstant: scrollView.frame.width).isActive = true
//        contentView.heightAnchor.constraint(equalToConstant: scrollView.frame.height).isActive = true
        
        // 콜렉션 뷰
        mainCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        mainCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        mainCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        mainCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
//        mainCollectionView.topAnchor.constraint(equalTo: topWhiteView.bottomAnchor, constant: 0).isActive = true
//        mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
//        mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
//        mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        
    }
    

}

// MARK: - extension
extension UIViewController: UICollectionViewDataSource {
    
    // 셀의 개수
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! mainCell
        cell.backgroundColor = .red
        return cell
    }
    
    
}

extension UIViewController: UICollectionViewDelegate {
    
}

extension UIViewController: UICollectionViewDelegateFlowLayout {
    // 셀 크기 설정
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
    
    // 디폴트 스페이싱 설정
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}
