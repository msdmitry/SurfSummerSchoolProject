//
//  PictureResponseModel.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/12/22.
//

import Foundation

struct PicturesResponseModel: Decodable {
    
    //MARK: - Internal Properties
    
    let id: String
    let title: String
    let content: String
    let photoUrl: String
    
    var date: Date {
        Date(timeIntervalSince1970: publicationDate / 1000) //потому что дата в милисекундах
    }
    
    //MARK: - Private Properties
    
    private let publicationDate: Double
    
}
