//
//  ViewController.swift
//  practiceLayout
//
//  Created by 이재승 on 2023/07/23.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = UINavigationController(rootViewController: testViewController3())
        let secondVC = UINavigationController(rootViewController: testViewController3())
        let thirdVC = UINavigationController(rootViewController: testViewController3())
        
        firstVC.tabBarItem = UITabBarItem(title: "메인", image: UIImage(systemName: "house"), tag: 0)
        secondVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        thirdVC.tabBarItem = UITabBarItem(title: "찜", image: UIImage(systemName: "heart"), tag: 2)
        
        viewControllers = [firstVC,secondVC,thirdVC]
        
    }


}

