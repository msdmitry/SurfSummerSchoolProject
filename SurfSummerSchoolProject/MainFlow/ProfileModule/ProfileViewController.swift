//
//  ProfileViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/3/22.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {

    //MARK: - Views
    
    


    @IBOutlet weak var logoutButtonConfigurator: UIButton!
    @IBOutlet weak var tableView: UITableView!
//        let tableView = UITableView()
    
    @IBAction func logoutButton(_ sender: UIButton) {
    }
    
    //MARK: - Properties
    
    var model = ProfileItemModel()
    
    //MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearnce()
        navigationItem.rightBarButtonItem = nil
    }
}

//MARK: - Private Methods

private extension ProfileViewController {
    
    func configureAppearnce() {
        configureTableView()
        configureButton()
        configureNavigationBar()
    }
    
    func configureTableView() {
//        view.addSubview(tableView)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
//            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
//            tableView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: 200)
//        ])
        //регистрируем ячейки
        tableView.register(UINib(nibName: "\(PortraitTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(PortraitTableViewCell.self)")
        tableView.register(UINib(nibName: "\(CityPhoneEmailTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(CityPhoneEmailTableViewCell.self)")
        tableView.dataSource = self
//        tableView.separatorStyle = .
    }
    
    func configureButton() {
        logoutButtonConfigurator.setTitle("Выйти", for: .normal)
        logoutButtonConfigurator.setTitleColor(.white, for: .normal)
        logoutButtonConfigurator.titleLabel!.font = .systemFont(ofSize: 25, weight: .semibold)
        logoutButtonConfigurator.backgroundColor = .black
        logoutButtonConfigurator.tintColor = .white
    }
    
    func configureNavigationBar() {
        navigationItem.title = "Профиль"
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
}

//MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(PortraitTableViewCell.self)")
            if let cell = cell as? PortraitTableViewCell {
                cell.avatar = self.model.userPortrait
                cell.firstName = self.model.userName ?? ""
                cell.lastName = model.userSurname ?? ""
                cell.about = self.model.userStatus ?? ""
                }
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(CityPhoneEmailTableViewCell.self)")
            if let cell = cell as? CityPhoneEmailTableViewCell {
                cell.headingName = "Город"
                cell.subheadingName = model.userCity ?? ""
            }
            return cell ?? UITableViewCell()
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(CityPhoneEmailTableViewCell.self)")
            if let cell = cell as? CityPhoneEmailTableViewCell {
                cell.headingName = "Телефон"
                cell.subheadingName = model.userPhone ?? ""
            }
            return cell ?? UITableViewCell()
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(CityPhoneEmailTableViewCell.self)")
            if let cell = cell as? CityPhoneEmailTableViewCell {
                cell.headingName = "Почта"
                cell.subheadingName = model.userEmail ?? ""
                }
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    
}
    



        
