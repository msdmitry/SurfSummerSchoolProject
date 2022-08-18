//
//  BaseTokenStorage.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/12/22.
//

import Foundation

struct BaseTokenStorage: TokenStorage {
    
    func getToken() throws -> TokenContainer {
        TokenContainer(token: "ceee475c1fd17e93151ebfffb2c404e4d8f12e586d679dddececce6d660de5b9")
    }
    
    func set(newToken: TokenContainer) throws { }
    
}
