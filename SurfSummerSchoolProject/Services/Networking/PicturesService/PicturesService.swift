//
//  PicturesService.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/12/22.
//

import Foundation

struct PicturesService {
    
    let dataTask = BaseNetworkTask<EmptyModel, [PicturesResponseModel]>(
        inNeedInjectToken: true,
        method: .get,
        path: "picture/")
    
    func loadPictures(_ onResponceWasRecieved: @escaping (_ result: Result<[PicturesResponseModel], Error>) -> Void
    ) {
        dataTask.performRequest(onResponceWasRecieved)
    }
    
}
