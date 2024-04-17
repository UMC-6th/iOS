//
//  MainViewController.swift
//  Week2
//
//  Created by 이승민 on 4/17/24.
//

import UIKit

final class MainViewController: UIViewController {
    // MARK: - Properties
    private let productArray = DataManager().getProductData()
    private let mainView = MainView()
    
    // MARK: - View 설정
    override func loadView() {
        view = mainView
    }
    
    // MARK: - ViewDidLodad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNaviBar()
        setupCollectionView()
        setupTableView()
    }
    
    // MARK: - 네비게이션바 설정
    private func setupNaviBar() {
        // 왼쪽
        let titleLabel = UILabel().then {
            $0.text = "광명동"
            $0.font = UIFont.boldSystemFont(ofSize: 17)
        }
        
        let titleItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.leftBarButtonItem = titleItem
        
        // 오른쪽
        let searchButton = UIButton(type: .custom).then {
            $0.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
            $0.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            $0.tintColor = .black
        }
        let searchButtonItem = UIBarButtonItem(customView: searchButton)
        
        let notificationButton = UIButton(type: .custom).then {
            $0.setImage(UIImage(systemName: "bell"), for: .normal)
            $0.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            $0.tintColor = .black
        }
        let notificationButtonItem = UIBarButtonItem(customView: notificationButton)
        
        let menuButton = UIButton(type: .custom).then {
            $0.setImage(UIImage(systemName: "line.horizontal.3"), for: .normal)
            $0.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            $0.tintColor = .black
        }
        let menuButtonItem = UIBarButtonItem(customView: menuButton)
        
        self.navigationItem.rightBarButtonItems = [notificationButtonItem, searchButtonItem, menuButtonItem]
    }
    
    // MARK: - 컬렉션뷰 설정
    private func setupCollectionView() {
        let cv = mainView.collectionView
        
        cv.dataSource = self
        cv.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "MainCollectionViewCell")
    }
    
    // MARK: - 테이블뷰 설정
    private func setupTableView() {
        let tb = mainView.tableView
        
        tb.dataSource = self
        tb.tableHeaderView = UIView()
        tb.rowHeight = 120
        tb.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        
        let data = productArray[indexPath.row]
        
        cell.thumnailImage.image = data.tumnailImage
        cell.titleLabel.text = data.title
        cell.placeLabel.text = data.place
        cell.priceLabel.text = "\(data.price)원"
        cell.commentNumLabel.text = data.commentNum
        cell.heartNumLabel.text = data.heartNum
        
        return cell
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        
        let data = productArray[indexPath.row]
        
        cell.thumnailImage.image = data.tumnailImage
        cell.titleLabel.text = data.title
        cell.priceLabel.text = "\(data.price)원"
        
        return cell
    }
}
