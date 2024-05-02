//
//  CollectionContainerTableViewCell.swift
//  week2hw
//
//  Created by 이재용 on 5/2/24.
//

import UIKit

class CollectionContainerTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var collectionView: UICollectionView!
    var titleLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCollectionView()
    }
    
    private func setupTitleLabel() {
            titleLabel = UILabel()
            titleLabel.text = "Collection Section Title"  // 제목 설정
            titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(titleLabel)

            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
            ])
        }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 120) // 적절한 크기로 설정
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionCellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        let data = collectionCellData[indexPath.row]
        cell.configCell(with: data)
        return cell
    }
}

class CollectionViewCell: UICollectionViewCell {
    var titleLabel: UILabel!
    var imageView: UIImageView!
    var priceLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 90, height: 90))
        titleLabel = UILabel(frame: CGRect(x: 5, y: 95, width: 90, height: 15))
        priceLabel = UILabel(frame: CGRect(x: 5, y: 110, width: 90, height: 15))
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
    }
    
    func configCell(with data: CollectionCellDataset) {
        imageView.image = UIImage(systemName: data.imageStr)
        titleLabel.text = data.title
        priceLabel.text = data.price
    }
}
