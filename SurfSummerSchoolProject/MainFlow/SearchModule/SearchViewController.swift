//
//  SearchViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/7/22.
//

import UIKit

class SearchViewController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
//        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func configureNavigationBar() {
        navigationItem.title = "Тут будет поиск"
        let backButton = UIBarButtonItem(image: UIImage(named: "back-arrow"),
                                         style: .plain,
                                         target: navigationController,
                                         action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backButton
        backButton.tintColor = .black
    }
    
}
