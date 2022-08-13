//
//  TokenStorage.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/12/22.
//

import Foundation

protocol TokenStorage {
    
    func getToken() throws -> TokenContainer
    func set(newToken: TokenContainer) throws
    
}
