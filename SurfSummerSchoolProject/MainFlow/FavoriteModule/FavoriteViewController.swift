//
//  FavoriteViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/10/22.
//

import UIKit

class FavoriteViewController: UIViewController {

    
    //MARK: - Views
    
    private let tableView = UITableView()
    let favoriteImageTableViewCell = FavoriteImageTableViewCell()

    
    //MARK: - Properties
    
    var model: FavoriteItemModel?
//    var model2: DetailItemModel?
    
    
    //MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearnce()
    }


}

    //MARK: - Private Methods

private extension FavoriteViewController {
    
    func configureAppearnce() {
        configureTableView()
        configureNavigationBar()
    }
    
    func configureNavigationBar() {
        navigationItem.leftBarButtonItem = nil
        navigationItem.title = "Избранное"
//        navigationItem.title = model?.title
        let searchButton = UIBarButtonItem(image: UIImage(named: "searchButton"), style: .plain, target: self, action: #selector(callSearchViewController))
        navigationItem.rightBarButtonItem = searchButton
            searchButton.tintColor = .black
    }
    
    @objc
    func callSearchViewController() {
        let searchVC = SearchViewController()
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false //прописываем всегда при создании вью из кода
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        //регистрируем ячейки
        tableView.register(UINib(nibName: "\(FavoriteImageTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(FavoriteImageTableViewCell.self)")
        tableView.register(UINib(nibName: "\(DetailTitleTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(DetailTitleTableViewCell.self)")
        tableView.register(UINib(nibName: "\(DetailTextTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(DetailTextTableViewCell.self)")
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
}

//MARK: - UITableViewDataSource

extension FavoriteViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(FavoriteImageTableViewCell.self)")
            if cell is FavoriteImageTableViewCell {
//                cell.image = model?.image
            favoriteImageTableViewCell.image = model?.image
            }
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(DetailTitleTableViewCell.self)")
            if let cell = cell as? DetailTitleTableViewCell {
                cell.title = "Самый милый корги"
                cell.date = "12.05.2022"
//                cell.title = model?.title ?? ""
//                cell.date = model?.dateCreation ?? ""
            }
            return cell ?? UITableViewCell()
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(DetailTextTableViewCell.self)")
            if let cell = cell as? DetailTextTableViewCell {
                cell.text = "Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один способ проконтролировать вкус напитка и приготовить его именно так, как нравится вам. \n \nТеперь, кроме регулировки экстракции, настройки помола, времени заваривания и многоuj что помогает выделять нужные характеристики кофе, вы сможете выбрать и кружку для кофе в зависимости от сорта."
//                cell.text = model?.content
            }
            return cell ?? UITableViewCell()
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(FavoriteImageTableViewCell.self)")
            if cell is FavoriteImageTableViewCell {
//                cell.image = model?.image
            favoriteImageTableViewCell.image = model?.image
            }
            return cell ?? UITableViewCell()
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(DetailTitleTableViewCell.self)")
            if let cell = cell as? DetailTitleTableViewCell {
                cell.title = "Самый милый корги"
                cell.date = "12.05.2022"
//                cell.title = model?.title ?? ""
//                cell.date = model?.dateCreation ?? ""
            }
            return cell ?? UITableViewCell()
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(DetailTextTableViewCell.self)")
            if let cell = cell as? DetailTextTableViewCell {
                cell.text = "Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один способ проконтролировать вкус напитка и приготовить его именно так, как нравится вам. \n \nТеперь, кроме регулировки экстракции, настройки помола, времени заваривания и многого что помогает выделять нужные характеристики кофе, вы сможете выбрать и кружку для кофе в зависимости от сорта."
//                cell.text = model?.content
            }
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }

    }

}
