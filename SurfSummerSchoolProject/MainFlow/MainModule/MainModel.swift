//
//  MainModel.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/7/22.
//

import Foundation
import UIKit


final class MainModel {

    // MARK: - Events
    var didItemsUpdated: (() -> Void)?

    // MARK: - Properties
    let pictureService = PicturesService()
    var items: [DetailItemModel] = [] {
        didSet {
            didItemsUpdated?()
        }
    }
    
    // MARK: - Methods
    func loadPosts() {
        pictureService.loadPictures { [weak self] result in
            switch result {
            case .success(let pictures):
                self?.items = pictures.map { pictureModel in
                    DetailItemModel(
                        imageUrlInString: pictureModel.photoUrl,
                        title: pictureModel.title,
                        isFavorite: false, // TODO: - Need to implement `FavoriteService`
                        content: pictureModel.content,
                        dateCreation: pictureModel.date
                    )
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    MainViewController().navigationController?.pushViewController(ErrorViewController(), animated: true)
                }
//            try error
            }
        }
    }


}
