//
//  TabBarViewController.swift
//  Week1
//
//  Created by 이승민 on 4/3/24.
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
        tabBar.tintColor = .lightGray
        tabBar.isTranslucent = false
        
        let searchViewController = SearchViewController()
        let bookmarkViewController = BookmarkViewController()
        let mainViewController = MainViewController()
        let orderDetailsViewController = OrderDetailsViewController()
        let myPageViewController = MyPageViewController()
        
        // 탭 바 이이템 설정
        searchViewController.tabBarItem = UITabBarItem(
            title: "검색",
            image: UIImage(systemName: "magnifyingglass"),
            selectedImage: UIImage(systemName: "magnifyingglass")
        )
        bookmarkViewController.tabBarItem = UITabBarItem(
            title: "찜",
            image: UIImage(systemName: "heart"),
            selectedImage: UIImage(systemName: "heart.fill")
        )
        mainViewController.tabBarItem = UITabBarItem(
            title: "배민",
            image: UIImage(systemName: "star"),
            selectedImage: UIImage(systemName: "star.fill")
        )
        orderDetailsViewController.tabBarItem = UITabBarItem(
            title: "주문내역",
            image: UIImage(systemName: "book.pages"),
            selectedImage: UIImage(systemName: "book.pages.fill")
        )
        myPageViewController.tabBarItem = UITabBarItem(
            title: "my배민",
            image: UIImage(systemName: "face.smiling"),
            selectedImage: UIImage(systemName: "face.smiling.inverse")
        )
        
        let tabItems = [
            searchViewController,
            bookmarkViewController,
            mainViewController,
            orderDetailsViewController,
            myPageViewController
        ]
        
        setViewControllers(tabItems, animated: true)
    }
    
}
