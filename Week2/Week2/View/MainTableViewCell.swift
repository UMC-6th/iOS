//
//  MainTableViewCell.swift
//  Week2
//
//  Created by 이승민 on 4/17/24.
//

import UIKit
import SnapKit
import Then

final class MainTableViewCell: UITableViewCell {
    // MARK: - View
    let thumnailImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .brown
    }
    
    let titleLabel = UILabel().then {
        $0.numberOfLines = 2
    }
    
    let placeLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 13)
    }
    
    let priceLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 18)
    }
    
    private let commentIcon = UIImageView().then {
        $0.image = UIImage(systemName: "message")
        $0.tintColor = .lightGray
    }
    
    let commentNumLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 13)
    }
    
    private let heartIcon = UIImageView().then {
        $0.image = UIImage(systemName: "heart")
        $0.tintColor = .lightGray
    }
    
    let heartNumLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 13)
    }
    
    let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 3
        $0.distribution = .fill
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none // 셀 선택 이펙트 제거
        
        addViews()
        configureConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    private func addViews() {
        contentView.addSubview(thumnailImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(placeLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(commentIcon)
        stackView.addArrangedSubview(commentNumLabel)
        stackView.addArrangedSubview(heartIcon)
        stackView.addArrangedSubview(heartNumLabel)
    }
    
    private func configureConstraints() {
        thumnailImage.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.leading.equalTo(contentView).inset(10)
            make.centerY.equalTo(contentView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(thumnailImage)
            make.leading.equalTo(thumnailImage.snp.trailing).offset(10)
            make.trailing.equalTo(contentView).inset(10)
        }
        
        placeLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(titleLabel)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(placeLabel.snp.bottom).offset(7)
            make.leading.equalTo(titleLabel)
        }
        
        commentIcon.snp.makeConstraints { make in
            make.size.equalTo(14)
        }
        
        heartIcon.snp.makeConstraints { make in
            make.size.equalTo(14)
        }
        
        stackView.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(contentView).inset(20)
        }
    }
}
