//
//  TokenContainer.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/12/22.
//

import Foundation

struct TokenContainer {
    
    let token: String
    let receivingDate: Date
    
    var tokenExpiringTime: TimeInterval {
        39600
    }
    
    var isExpired: Bool {
        let now = Date()
        if receivingDate.addingTimeInterval(tokenExpiringTime) > now {
            return false
        } else {
            return true
        }
    }
    
}
