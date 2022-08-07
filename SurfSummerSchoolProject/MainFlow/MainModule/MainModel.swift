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
    var items: [ItemModel] = [] {
        didSet {
            didItemsUpdated?()
        }
    }

    // MARK: - Methods
    func getPosts() {
        items = Array(repeating: ItemModel.createDefault(), count: 100)
    }

}

struct ItemModel {
    let image: UIImage?
    let title: String
    var isFavorite: Bool
    let dateCreation: String
    let content: String

    static func createDefault() -> ItemModel {
        .init(image: UIImage(named: "korgi"), title: "Самый милый корги", isFavorite: false, dateCreation: "12.05.2022", content: "Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один способ проконтролировать вкус напитка и приготовить его именно так, как нравится вам. \n Теперь, кроме регулировки экстракции, настройки помола, времени заваривания и многого что помогает выделять нужные характеристики кофе, вы сможете выбрать и кружку для кофе в зависимости от сорта.")
    }

}
