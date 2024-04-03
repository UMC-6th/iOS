//
//  UIStackView+AddArrangedSubviews.swift
//  Week1
//
//  Created by 이승민 on 4/3/24.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
