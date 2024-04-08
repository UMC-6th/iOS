//
//  UIView+addSubViews.swift
//  Week1
//
//  Created by 이승민 on 4/3/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }
}
