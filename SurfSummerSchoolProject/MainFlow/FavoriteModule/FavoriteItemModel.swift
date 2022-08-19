//
//  FavoriteItemModel.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/10/22.
//

import Foundation
import UIKit

struct FavoriteItemModel {
    let image: UIImage?
    let title: String
    var isFavorite: Bool
    let dateCreation: String
    let content: String

    static func createDefault() -> FavoriteItemModel {
        .init(image: UIImage(named: "korgi"), title: "Самый милый корги", isFavorite: true, dateCreation: "12.05.2022", content: "Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один способ проконтролировать вкус напитка и приготовить его именно так, как нравится вам. \n \nТеперь, кроме регулировки экстракции, настройки помола, времени заваривания и многого что помогает выделять нужные характеристики кофе, вы сможете выбрать и кружку для кофе в зависимости от сорта.")
    }
}
