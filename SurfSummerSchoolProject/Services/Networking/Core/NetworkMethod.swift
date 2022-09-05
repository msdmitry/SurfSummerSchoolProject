//
//  NetworkMethod.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/12/22.
//

import Foundation

enum NetworkMethod: String {
    
    case get
    case post
    
}

extension NetworkMethod {
    
    var method: String {
        rawValue.uppercased()
    }
    
}
