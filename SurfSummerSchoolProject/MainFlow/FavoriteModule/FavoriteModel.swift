//
//  FavoriteModel.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/10/22.
//

import Foundation

final class FavoriteModel {

    // MARK: - Events
    var didItemsUpdated: (() -> Void)?

    // MARK: - Properties
    var items: [FavoriteItemModel] = [] {
        didSet {
            didItemsUpdated?()
        }
    }

    // MARK: - Methods
    func getPosts() {
        items = Array(repeating: FavoriteItemModel.createDefault(), count: 100)
    }

}
