//
//  TapBarViewController.swift
//  Week2
//
//  Created by 이승민 on 4/17/24.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.selectedIndex = 0
        
        tabBarConfig()
    }
    
    private func tabBarConfig() {
        tabBar.barTintColor = .white
        tabBar.tintColor = .black
        tabBar.isTranslucent = false
        
        let mainViewController = UINavigationController(rootViewController: MainViewController())
        let oneViewController = OneViewController()
        let twoViewController = TwoViewController()
        let threeViewController = ThreeViewController()
        let fourViewController = FourViewController()
        
        // 탭 바 이이템 설정
        mainViewController.tabBarItem = UITabBarItem(
            title: "홈",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        oneViewController.tabBarItem = UITabBarItem(
            title: "동네생활",
            image: UIImage(systemName: "heart"),
            selectedImage: UIImage(systemName: "heart.fill")
        )
        twoViewController.tabBarItem = UITabBarItem(
            title: "내 근처",
            image: UIImage(systemName: "star"),
            selectedImage: UIImage(systemName: "star.fill")
        )
        threeViewController.tabBarItem = UITabBarItem(
            title: "채팅",
            image: UIImage(systemName: "book.pages"),
            selectedImage: UIImage(systemName: "book.pages.fill")
        )
        fourViewController.tabBarItem = UITabBarItem(
            title: "나의 당근",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        
        let tabItems = [
            mainViewController,
            oneViewController,
            twoViewController,
            threeViewController,
            fourViewController
        ]
        
        setViewControllers(tabItems, animated: true)
    }
    
}
