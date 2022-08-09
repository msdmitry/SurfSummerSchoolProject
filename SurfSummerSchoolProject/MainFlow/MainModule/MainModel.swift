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
    var items: [DetailItemModel] = [] {
        didSet {
            didItemsUpdated?()
        }
    }

    // MARK: - Methods
    func getPosts() {
        items = Array(repeating: DetailItemModel.createDefault(), count: 100)
    }

}


