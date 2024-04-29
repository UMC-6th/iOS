//
//  mainCell.swift
//  Week2
//
//  Created by 김승원 on 4/8/24.
//

import UIKit

class mainCell: UICollectionViewCell {
    
    // MARK: - Properties
    let cellLabel: UILabel = {
        let lb = UILabel()
        lb.text = "임시 텍스트"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Views
    private func setUI() {
        contentView.addSubview(cellLabel)
        
    }
    
    private func setConstraints() {
        cellLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        cellLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
