//
//  MainCollectionViewCell.swift
//  Week2
//
//  Created by 이승민 on 4/17/24.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    // MARK: - View
    let thumnailImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .brown
    }
    
    let titleLabel = UILabel().then {
        $0.numberOfLines = 2
    }
    
    let priceLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 18)
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    private func addViews() {
        contentView.addSubview(thumnailImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
    }
    
    private func configureConstraints() {
        thumnailImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(contentView)
            make.height.equalTo(35)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(thumnailImage.snp.bottom).offset(5)
            make.leading.trailing.equalTo(thumnailImage)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.trailing.equalTo(thumnailImage)
            make.bottom.equalTo(contentView)
        }
    }
}
