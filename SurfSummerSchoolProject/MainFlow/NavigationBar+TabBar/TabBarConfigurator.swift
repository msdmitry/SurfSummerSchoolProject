//
//  TabBarConfigurator.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/3/22.
//

import Foundation
import UIKit

class TabBarConfigurator: NavigationBarConfigurator {
    
    //MARK: - Private property
    
    private let allTab: [TabBarModel] = [.main, .favorite, .profile]
    
    //MARK: - Internal func
    
    func configure() -> UITabBarController {
        return getTabBarController()
    }
    
}

private extension TabBarConfigurator {
    
    func getTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.tintColor = .black
        tabBarController.tabBar.unselectedItemTintColor = .lightGray
        tabBarController.viewControllers = getControllers()
        return tabBarController
    }
    
    func getControllers() -> [UIViewController] {
        var viewControllers = [UIViewController]()
        
        allTab.forEach { tab in
            let controller = getCurrentViewController(tab: tab)
            let navigationView = getNavigationController(rootViewController: controller)
            let tabBarItem = UITabBarItem(title: tab.title, image: tab.image, selectedImage: tab.selectedImage)
            controller.tabBarItem = tabBarItem
            viewControllers.append(navigationView)
        }
        
        return viewControllers
    }
    
    func getCurrentViewController(tab: TabBarModel) -> UIViewController {
        switch tab {
        case .main:
            return MainViewController()
        case .favorite:
            return FavoriteViewController()
        case .profile:
            return ProfileViewController()
        }
    }
    
}
