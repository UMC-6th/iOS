//
//  CellClass.swift
//  week2hw
//
//  Created by 이재용 on 4/16/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    let productImage = UIImageView()
    let titleLabel = UILabel()
    let addressLabel = UILabel()
    let priceLabel = UILabel()
    let chatNum = UILabel()
    let heartNum = UILabel()
    let chatImage = UIImageView()
    let heartImage = UIImageView()
    
    let stackView = UIStackView(arrangedSubviews: [])
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        setupViewALO()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
        setupViewALO()
    }
    // CellClass.swift 파일 내 ProductTableViewCell 클래스에 추가
    func configCell(with data: ProductCellDataset) {
        productImage.image = UIImage(systemName: data.imageStr) // 이미지 설정
        titleLabel.text = data.title                            // 제목 설정
        addressLabel.text = data.address                        // 주소 설정
        priceLabel.text = data.price                            // 가격 설정
        chatNum.text = "\(data.chatNum)"                        // 채팅 수 설정
        heartNum.text = "\(data.heartNum)"                      // 좋아요 수 설정
        chatImage.image = UIImage(systemName: "message")        // 채팅 아이콘 설정
        heartImage.image = UIImage(systemName: "heart.fill")    // 하트 아이콘 설정
    }

    private func configureUI() {
        stackView.addArrangedSubview(chatImage)
        stackView.addArrangedSubview(chatNum)
        stackView.addArrangedSubview(heartImage)
        stackView.addArrangedSubview(heartNum)
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.distribution = .fillEqually
        
        contentView.addSubview(productImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(addressLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(stackView)
    }
    
    private func setupViewALO() {
        // 모든 뷰의 translatesAutoresizingMaskIntoConstraints을 false로 설정
        productImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        chatNum.translatesAutoresizingMaskIntoConstraints = false
        heartNum.translatesAutoresizingMaskIntoConstraints = false
        chatImage.translatesAutoresizingMaskIntoConstraints = false
        heartImage.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            productImage.widthAnchor.constraint(equalToConstant: 100), // 가로 세로 크기 명시
            productImage.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            
            addressLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            addressLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            
            priceLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            priceLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10),
            
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}

class EventTableViewCell: UITableViewCell{
    let eventImage = UIImageView()
    let titleLabel = UILabel()
    let leftSubtilteLabel = UILabel()
    let rightSubtitleLabel = UILabel()
    
    let stackView = UIStackView(arrangedSubviews: [])
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        setupViewALO()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
        setupViewALO()
    }
    // CellClass.swift 파일 내 ProductTableViewCell 클래스에 추가
    func configCell(with data: EventCellDataset) {
        eventImage.image = UIImage(systemName: data.imageStr) // 이미지 설정
        titleLabel.text = data.title                            // 제목 설정
        leftSubtilteLabel.text = data.leftSubtitle
        rightSubtitleLabel.text = data.rightSubtitle
    }

    private func configureUI() {
        stackView.addArrangedSubview(leftSubtilteLabel)
        stackView.addArrangedSubview(rightSubtitleLabel)
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.distribution = .fillEqually
        
        contentView.addSubview(eventImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(stackView)
    }
    
    private func setupViewALO() {
        // 모든 뷰의 translatesAutoresizingMaskIntoConstraints을 false로 설정
        eventImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eventImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            eventImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            eventImage.widthAnchor.constraint(equalToConstant: 100), // 가로 세로 크기 명시
            eventImage.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.leadingAnchor.constraint(equalTo: eventImage.trailingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            
            stackView.leadingAnchor.constraint(equalTo: eventImage.trailingAnchor, constant: 20),
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            
        ])
    }
}

class CollectionContainerViewCell: UITableViewCell{
    let collectionImage = UIImageView()
    let titleLabel = UILabel()
    let priceLabel = UILabel()
}

