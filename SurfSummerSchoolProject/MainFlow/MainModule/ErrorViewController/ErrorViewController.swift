//
//  ErrorViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/15/22.
//

import UIKit

class ErrorViewController: UIViewController {


    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var reloadButtonLabel: UIButton!
    
    @IBAction func reloadButton(_ sender: UIButton) {
        navigationController?.pushViewController(MainViewController(), animated: true)
        MainViewController().handleRefresh()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureErrorMessageLabel()
        configureReloadLabel()
    }
    
    func configureReloadLabel() {
        reloadButtonLabel.backgroundColor = .black
        reloadButtonLabel.setTitle("Обновить", for: .normal)
        reloadButtonLabel.setTitleColor(.white, for: .normal)
    }
    
    func configureErrorMessageLabel() {
        errorMessageLabel.numberOfLines = 2
        errorMessageLabel.text = "Не удалось загрузить ленту \nОбновите экран или попробуйте позже"
        errorMessageLabel.font = UIFont(name: "SFProText-Regular", size: 14)
        errorMessageLabel.textColor = UIColor(named: "textLabelsColor")

    }
    
    func configureNavigationBar() {
        navigationItem.title = "Главная"
        navigationItem.hidesBackButton = true
//
//        let backButton = UIBarButtonItem(image: UIImage(named: "back-arrow"),
//                                         style: .plain,
//                                         target: navigationController,
//                                         action:
//                                            #selector(UINavigationController.popViewController(animated:)))
//            navigationItem.leftBarButtonItem = backButton
//            backButton.tintColor = .black
        
        let searchButton = UIBarButtonItem(image: UIImage(named: "searchButton"), style: .plain, target: self, action: #selector(callSearchViewController))
            navigationItem.rightBarButtonItem = searchButton
            searchButton.tintColor = .black
    }
    
    @objc
    func callSearchViewController() {
        let searchVC = SearchViewController()
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    func handleRefresh() {
        Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false) { (timer) in
            DispatchQueue.main.async {
                MainViewController().handleRefresh()
            }
        }
    }

}
