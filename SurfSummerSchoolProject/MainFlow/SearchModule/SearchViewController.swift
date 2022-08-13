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
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.rightBackSwipe))
        swipeRecognizer.direction = .down
        view.addGestureRecognizer(swipeRecognizer)
    }
    
    @objc
    func rightBackSwipe(sender: UISwipeGestureRecognizer) {
        dismiss(animated: true, completion: nil)
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
