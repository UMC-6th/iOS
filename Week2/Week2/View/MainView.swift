//
//  MainView.swift
//  Week2
//
//  Created by 이승민 on 4/17/24.
//

import UIKit

final class MainView: UIView {
    // MARK: - View
    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //    layout.minimumLineSpacing = 8.0
        layout.minimumInteritemSpacing = 8.0
        layout.itemSize = CGSize(width: 100, height: 100)
        return layout
    }()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout).then {
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        //    view.scrollIndicatorInsets = UIEdgeInsets(top: -2, left: 0, bottom: 0, right: 4)
        $0.contentInset = .zero
        $0.backgroundColor = .clear
        $0.clipsToBounds = true
    }
    
    let tableView = UITableView().then {
        $0.separatorInset.left = 20 // 구분선
        $0.separatorInset.right = 20 // 구분선
    }
    
    private let uploadButton = UIButton().then {
        $0.setTitle("+ 글쓰기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .orange
        $0.layer.cornerRadius = 15
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        addViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    private func addViews() {
        self.addSubview(collectionView)
        self.addSubview(tableView)
        self.addSubview(uploadButton)
    }
    
    private func configureConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        
        uploadButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(90)
            make.trailing.bottom.equalToSuperview().inset(20)
        }
    }
}
