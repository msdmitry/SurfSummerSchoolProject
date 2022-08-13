//
//  BaseTokenStorage.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/12/22.
//

import Foundation

struct BaseTokenStorage: TokenStorage {
    
    func getToken() throws -> TokenContainer {
        TokenContainer(token: "e69d7e955f8f01daae9e6db18325f29af746794fbc5455e78235feda49383275")
    }
    
    func set(newToken: TokenContainer) throws { }
    
}
