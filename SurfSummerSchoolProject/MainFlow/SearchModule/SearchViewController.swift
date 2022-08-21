//
//  SearchViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/7/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    
    
    func configureNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(named: "back-arrow"),
                                         style: .plain,
                                         target: navigationController,
                                         action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backButton
        backButton.tintColor = .black
        navigationItem.titleView = searchBar
    }
    
}

