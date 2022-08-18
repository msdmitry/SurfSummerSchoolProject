//
//  MainViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/3/22.
//

import UIKit
import Network

final class MainViewController: UIViewController, UIGestureRecognizerDelegate {

    // MARK: - Constants
    
    private enum Constants {
        static let horisontalInset: CGFloat = 16
        static let spaceBetweenElements: CGFloat = 7
        static let spaceBetweenRows: CGFloat = 8
    }

    // MARK: - Private Properties
    
    private let model: MainModel = .init()

    // MARK: - Views
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let myRefreshControl = UIRefreshControl()
    
    
    // MARK: - Lifeсyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureApperance()
        
        myRefreshControl.addTarget(self, action: #selector(MainViewController.handleRefresh), for: .valueChanged)
        collectionView.refreshControl = myRefreshControl
        
        let credentials = AuthRequestModel(phone: "+71234567890", password: "qwerty")
        AuthService().performLoginRequest(credentials: credentials) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.navigationController?.pushViewController(ErrorViewController(), animated: true)
                }
                print(error)
            }
        }
        PicturesService().loadPictures { result in
            print(result)
        }
    }

}

// MARK: - Private Methods

extension MainViewController {
    
    func configureApperance() {
        activityIndicator?.startAnimating()
        configureCollection()
        configureModel()
        configureNavigationBar()
        model.loadPosts()
//        model.items[5].isFavorite = true
    }
    
    func configureCollection() {
        collectionView?.register(UINib(nibName: "\(MainItemCollectionViewCell.self)", bundle: .main),
                                forCellWithReuseIdentifier: "\(MainItemCollectionViewCell.self)")
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.contentInset = .init(top: 10, left: 16, bottom: 10, right: 16)
        
//        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.rightBackSwipe))
//        swipeRecognizer.direction = .right
//        view.addGestureRecognizer(swipeRecognizer)
    }
    
//    @objc
//    func rightBackSwipe(sender: UISwipeGestureRecognizer) {
//        dismiss(animated: true, completion: nil)
//    }

    func configureModel() {
         model.didItemsUpdated = { [weak self] in
             DispatchQueue.main.async {
//           DispatchQueue.main.asyncAfter(deadline: .now() + 5) { - раскомментировать для искусственного замедления, чтобы увидеть спиннер загрузки (UIActivityIndicatorView)
                 self?.collectionView?.reloadData()
                 self?.activityIndicator?.stopAnimating()
                 self?.activityIndicator?.hidesWhenStopped = true
             }
         }
     }
    
    func configureNavigationBar() {
        navigationItem.leftBarButtonItem = nil
        navigationItem.hidesBackButton = true
        navigationItem.title = "Главная"
        let searchButton = UIBarButtonItem(image: UIImage(named: "searchButton"), style: .plain, target: self, action: #selector(callSearchViewController))
        navigationItem.rightBarButtonItem = searchButton
        searchButton.tintColor = .black
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @objc
    func callSearchViewController() {
        let searchVC = SearchViewController()
        navigationController?.pushViewController(searchVC, animated: true)
    }
     
    @objc
    func handleRefresh() {
        Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false) { (timer) in
            MainItemCollectionViewCell().prepareForReuse()
            self.configureApperance()
            self.myRefreshControl.endRefreshing()
            self.checkingInternetConnectionAndPushError()
            
        }
    }
    
    func checkingInternetConnectionAndPushError() {
        if InternetConnectionManager.isConnectedToNetwork() {
            print("Connected")
        } else {
            self.navigationController?.pushViewController(ErrorViewController(), animated: true)
            print("Not Connected Not Connected Not Connected Not Connected Not Connected Not Connected Not Connected Not Connected Not Connected Not Connected Not Connected Not Connected Not Connected Not Connected Not Connected Not Connected Not Connected Not Connected")
        }
    }
    
    func showErrorViewController() {
        let errorVC = ErrorViewController()
        navigationController?.pushViewController(errorVC, animated: true)
    }

}

// MARK: - UICollection

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MainItemCollectionViewCell.self)", for: indexPath)
        if let cell = cell as? MainItemCollectionViewCell {
            let item = model.items[indexPath.row]
            cell.title = item.title
            cell.isFavorite = item.isFavorite
            cell.imageUrlInString = item.imageUrlInString
            cell.didFavoritesTapped = { [weak self] in
                self?.model.items[indexPath.row].isFavorite.toggle()
            }
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (view.frame.width - Constants.horisontalInset * 2 - Constants.spaceBetweenElements) / 2
        return CGSize(width: itemWidth, height: 1.46 * itemWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenRows
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenElements
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.model = model.items[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
