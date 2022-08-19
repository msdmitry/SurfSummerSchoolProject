//
//  AuthService.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/12/22.
//

import Foundation

struct AuthService {
    
    let dataTask = BaseNetworkTask<AuthRequestModel, AuthResponseModel>(
        inNeedInjectToken: false,
        method: .post,
        path: "auth/login")
    
    func performLoginRequestAndSaveToken(
        credentials: AuthRequestModel,
        _ onResponceWasRecieved: @escaping (_ result: Result<AuthResponseModel, Error>) -> Void
    ) {
        dataTask.performRequest(input: credentials) { result in
            if case let .success(responseModel) = result {
                do {
                    try dataTask.tokenStorage.set(newToken: TokenContainer(token: responseModel.token, receivingDate: .now))
                } catch {
                    print(error)
                }
            }
            onResponceWasRecieved(result)
        }
    }
    
}
