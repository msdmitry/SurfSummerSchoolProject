//
//  NavigationBarConfigurator.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/3/22.
//

import Foundation
import UIKit

class NavigationBarConfigurator {
    
func getNavigationController(rootViewController: UIViewController) -> UIViewController {
    let navigationController = UINavigationController(rootViewController: rootViewController)
    let searchButton = UIBarButtonItem(image: UIImage(named: "searchButton"), style: .plain, target: self, action: #selector(someSelector))
    
    navigationController.navigationBar.topItem?.rightBarButtonItem = searchButton
    navigationController.navigationBar.topItem?.title = "Главная"
    
    return navigationController
}

    @objc func someSelector() {
        print("123123123")
    }
    
}
