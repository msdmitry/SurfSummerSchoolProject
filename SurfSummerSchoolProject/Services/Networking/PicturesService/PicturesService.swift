//
//  PicturesService.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/12/22.
//

import Foundation
import UIKit

struct PicturesService {
    
    let dataTask = BaseNetworkTask<EmptyModel, [PicturesResponseModel]>(
        inNeedInjectToken: true,
        method: .get,
        path: "picture/")
    
    let loadingErrorState = UIViewController()
    
    func loadPictures(_ onResponceWasRecieved: @escaping (_ result: Result<[PicturesResponseModel], Error>) -> Void
    ) {
        dataTask.performRequest(onResponceWasRecieved)
    }

}
