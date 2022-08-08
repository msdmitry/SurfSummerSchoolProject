//
//  NavigationBarConfigurator.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/3/22.
//

import Foundation
import UIKit


class NavigationBarConfigurator: UINavigationController {

func getNavigationController(rootViewController: UIViewController) -> UIViewController {
    
    let navigationController = UINavigationController(rootViewController: rootViewController)
    let searchButton = UIBarButtonItem(image: UIImage(named: "searchButton"), style: .plain, target: self, action: #selector(callSearchViewController))
    
    
    searchButton.tintColor = .black

    
    let backButton = UIBarButtonItem(image: UIImage(named: "back-arrow"), style: .plain, target: navigationController, action: #selector(UINavigationController.popViewController(animated:)))
    backButton.tintColor = .black
    
    
    navigationController.navigationBar.topItem?.rightBarButtonItem = searchButton
    navigationController.navigationBar.topItem?.title = "Главная"
    navigationController.navigationBar.topItem?.leftBarButtonItem = backButton
    
    return navigationController
}
    
    @objc func callSearchViewController() {
        let searchVC = SearchViewController()
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
}

