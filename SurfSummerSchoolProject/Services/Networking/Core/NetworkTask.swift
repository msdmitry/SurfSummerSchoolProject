//
//  NetworkTask.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/12/22.
//

import Foundation

protocol NetworkTask {
    
    associatedtype Input: Encodable
    associatedtype Output: Decodable
    
    var baseURL: URL? { get }
    var path: String { get }
    var completedURL: URL? { get }
    var method: NetworkMethod { get }
    
    func performRequest(
        input: Input,
        _ onResponceWasRecieved: @escaping (_ result: Result<Output, Error>) -> Void
    )
}

extension NetworkTask {
    
    var completedURL: URL? {
        baseURL?.appendingPathComponent(path)
    }
    
}
