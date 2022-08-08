//
//  SearchModel.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/7/22.
//

import Foundation
import UIKit

struct SearchViewModel {
    let image: UIImage?
    let title: String
    var isFavorite: Bool
    let dateCreation: String
    let content: String

    static func createDefault() -> SearchViewModel {
        .init(image: UIImage(named: "korgi"), title: "Самый милый корги", isFavorite: false, dateCreation: "12.05.2022", content: "Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один способ проконтролировать вкус напитка и приготовить его именно так, как нравится вам. \n Теперь, кроме регулировки экстракции, настройки помола, времени заваривания и многого что помогает выделять нужные характеристики кофе, вы сможете выбрать и кружку для кофе в зависимости от сорта.")
    }

}

//final class SearchModel {
//
//    // MARK: - Events
//    var didItemsUpdated: (() -> Void)?
//
//    // MARK: - Properties
//    var items: [SearchViewModel] = [] {
//        didSet {
//            didItemsUpdated?()
//        }
//    }
//
//    // MARK: - Methods
//    func getPosts() {
//        items = Array(repeating: SearchViewModel.createDefault(), count: 100)
//    }
//
//}

