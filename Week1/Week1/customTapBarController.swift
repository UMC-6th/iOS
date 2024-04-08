//
//  customTapBarController.swift
//  Week1
//
//  Created by 김승원 on 4/8/24.
//

import UIKit

class customTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        self.tabBar.tintColor = .lightGray
        self.tabBar.backgroundColor = .white
    
        let searchIcon = UIViewController()
        let heartIcon = UIViewController()
        let logoIcon = UIViewController()
        let orderedIcon = UIViewController()
        let smileIcon = UIViewController()
        
        searchIcon.view.tintColor = .lightGray
        heartIcon.view.tintColor = .lightGray
        logoIcon.view.tintColor = .lightGray
        orderedIcon.view.tintColor = .lightGray
        smileIcon.view.tintColor = .lightGray
        
        searchIcon.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        heartIcon.tabBarItem = UITabBarItem(title: "찜", image: UIImage(systemName: "heart"), tag: 1)
        logoIcon.tabBarItem = UITabBarItem(title: "배민", image: UIImage(systemName: "link.circle"), tag: 2)
        orderedIcon.tabBarItem = UITabBarItem(title: "주문내역", image: UIImage(systemName: "newspaper"), tag: 3)
        smileIcon.tabBarItem = UITabBarItem(title: "my배민", image: UIImage(systemName: "face.smiling"), tag: 4)
        self.viewControllers = [searchIcon, heartIcon, logoIcon, orderedIcon, smileIcon]
        
        
        
    }
}
