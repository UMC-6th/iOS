//
//  ViewController.swift
//  week2hw
//
//  Created by 이재용 on 4/11/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let productCount: Int = productCellData.count
        let eventCount: Int = eventCellData.count
        let collectionCount: Int = 1
        let productsPerGroup = 5
        
        // 첫 번째 셀은 항상 콜렉션 뷰 셀
        let totalCells = collectionCount + (productCount / productsPerGroup) * (productsPerGroup + 1) + min(eventCount, (productCount / productsPerGroup))
        
        return totalCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productsPerGroup = 5
        let totalCycleLength = productsPerGroup + 1 // 상품 5개 + 이벤트 1개
        
        if indexPath.row == 0 {
            // 첫 번째 셀은 콜렉션 뷰 셀로 생성
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionContainerTableViewCell", for: indexPath) as? CollectionContainerTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            let adjustedIndex = indexPath.row - 1
            let positionInCycle = adjustedIndex % totalCycleLength
            
            if positionInCycle == productsPerGroup {
                // 이벤트 셀
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as? EventTableViewCell else {
                    return UITableViewCell()
                }
                let eventIndex = adjustedIndex / totalCycleLength
                if eventIndex < eventCellData.count {
                    let data = eventCellData[eventIndex]
                    cell.configCell(with: data)
                }
                return cell
            } else {
                // 상품 셀
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell else {
                    return UITableViewCell()
                }
                let productIndex = adjustedIndex - (adjustedIndex / totalCycleLength)
                if productIndex < productCellData.count {
                    let data = productCellData[productIndex]
                    cell.configCell(with: data)
                }
                return cell
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130 // 적절한 높이 값으로 조정
    }
    
    
    
    //MARK: components
    //최상단 네비게이션 바
    
    let homeLabel = makeLabel(withText: "학익동")
    let menuButton = makeButton(withSystemName: "line.3.horizontal")
    let searchButton = makeButton(withSystemName: "magnifyingglass")
    let bellButton = makeButton(withSystemName: "bell")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setNavigationBar()
        setupTableView()
    }
    
    func setNavigationBar() {
        let leftItem = UIBarButtonItem (customView: homeLabel)
        navigationItem.leftBarButtonItem = leftItem
        
        menuButton.tintColor = .black
        searchButton.tintColor = .black
        bellButton.tintColor = .black
        let stackView = UIStackView(arrangedSubviews: [menuButton, searchButton, bellButton])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        let rightItem = UIBarButtonItem (customView: stackView)
        navigationItem.rightBarButtonItem = rightItem
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.white // 배경색을 흰색으로 설정
        
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = UIColor.black // 아이콘 색상을 검은색으로 설정
    }
    //MARK: tableView Setting
    func setupTableView() {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // 등록하는 부분에 주의 깊게 확인
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "ProductTableViewCell")
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: "EventTableViewCell")
        tableView.register(CollectionContainerTableViewCell.self, forCellReuseIdentifier: "CollectionContainerTableViewCell")  // 이 줄이 중요
    }
}


extension ViewController {
    static func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        return label
    }
    
    static func makeButton(withSystemName name: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(systemName: name), for: .normal)
        button.tintColor = .white
        return button
    }
    
}
