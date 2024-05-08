//
//  TabbarViewController.swift
//  week2hw
//
//  Created by 이재용 on 4/16/24.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let homeVC = ViewController()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        let searchVC = ViewController2()
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        let notificationsVC = ViewController3()
        notificationsVC.tabBarItem = UITabBarItem(title: "Notifications", image: UIImage(systemName: "bell"), tag: 2)
        
        let messagesVC = ViewController4()
        messagesVC.tabBarItem = UITabBarItem(title: "Messages", image: UIImage(systemName: "message"), tag: 3)
        
        let settingsVC = ViewController5()
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        // UINavigationController를 사용하여 각 탭에 대한 네비게이션 스택을 추가
        let controllers = [homeVC, searchVC, notificationsVC, messagesVC, settingsVC].map { UINavigationController(rootViewController: $0) }
        viewControllers = controllers
        
        tabBar.barTintColor = UIColor.white //탭바 색상 설정
        tabBar.isTranslucent = false  // 배경색 변경을 위해 반투명 속성 비활성화
        tabBar.tintColor = UIColor.orange
        selectedIndex = 0  // 첫 번째 탭을 시작 탭으로 설정
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
