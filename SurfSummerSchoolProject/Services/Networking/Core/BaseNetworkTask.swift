//
//  BaseNetworkTask.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/12/22.
//

import Foundation

struct BaseNetworkTask<AbstractInput: Encodable, AbstractOutput: Decodable>: NetworkTask {    

    //MARK: - NetworkTask
    
    typealias Input = AbstractInput
    typealias Output = AbstractOutput
    
    var baseURL: URL? {
        URL(string: "https://pictures.chronicker.fun/api")
    }
    
    let path: String
    let method: NetworkMethod
    let session: URLSession = URLSession(configuration: .default)
    let isNeedInjectToken: Bool
    
    var tokenStorage: TokenStorage {
        BaseTokenStorage()
    }
    
    //MARK: - Initialization
    
    init(inNeedInjectToken: Bool, method: NetworkMethod, path: String) {
        self.isNeedInjectToken = inNeedInjectToken
        self.path = path
        self.method = method
    }
    
    //MARK: - NetworkTask
    
    func performRequest(
        input: AbstractInput,
        _ onResponceWasRecieved: @escaping (_ result: Result<AbstractOutput, Error>) -> Void
    ) {
        do {
            let request = try getRequest(with: input)
            session.dataTask(with: request) { data, response, error in
                if let error = error {
                    onResponceWasRecieved(.failure(error))
                } else if let data = data {
                    do {
                        let mappedData = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                        print(mappedData)
                        let mappedModel = try JSONDecoder().decode(AbstractOutput.self, from: data)
                        onResponceWasRecieved(.success(mappedModel))
                    } catch {
                        onResponceWasRecieved(.failure(error))
                    }
                } else {
                    onResponceWasRecieved(.failure(NetworkTaskError.unknownError))
                }
            }
            .resume()
        } catch {
            onResponceWasRecieved(.failure(error))
        }
    }
    
}

//MARK: - Empty Model

extension BaseNetworkTask where Input == EmptyModel {
    
    func performRequest(_ onResponceWasRecieved: @escaping (_ result: Result<AbstractOutput, Error>) -> Void) {
        performRequest(input: EmptyModel(), onResponceWasRecieved)
    }
    
}

//MARK: - Private Methods

private extension BaseNetworkTask {
    
    enum NetworkTaskError: Error {
        case unknownError
        case urlWasNotFound
        case urlComponentWasNotCreated
        case parametersIsNotVaildJsonObject
    }
    
    func getRequest(with parameters: AbstractInput) throws -> URLRequest {
        guard let url = completedURL else {
            throw NetworkTaskError.urlWasNotFound
        }
                
        var request: URLRequest
        switch method {
        case .get:
            let newUrl = try getUrlWithQueryParametrs(for: url, parameters: parameters)
            request = URLRequest(url: newUrl)
        case .post:
            request = URLRequest(url: url)
            request.httpBody = try getParametersForBody(from: parameters)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        if isNeedInjectToken {
            request.addValue("Token \(try tokenStorage.getToken().token)", forHTTPHeaderField: "Authorization")
        }
        request.httpMethod = method.method
        
        return request
    }
    
    func getParametersForBody(from encodableParameters: AbstractInput) throws -> Data {
        return try JSONEncoder().encode(encodableParameters)
    }
    
    func getUrlWithQueryParametrs(for url: URL, parameters: AbstractInput) throws -> URL {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw NetworkTaskError.urlComponentWasNotCreated
        }
        
        let parametersInDataRepresentation = try JSONEncoder().encode(parameters)
        let parametersInDictionaryRepresentation = try JSONSerialization.jsonObject(with: parametersInDataRepresentation)
        
        guard let parametersInDictionaryRepresentation = parametersInDictionaryRepresentation as? [String: Any] else {
            throw NetworkTaskError.parametersIsNotVaildJsonObject
        }
        
        let queryItems = parametersInDictionaryRepresentation.map { key, value in
            return URLQueryItem(name: key, value: "\(value)")
        }
        
        urlComponents.queryItems = queryItems
        
        guard let newUrlWithQuery = urlComponents.url else {
            throw NetworkTaskError.urlWasNotFound
        }
        
        return newUrlWithQuery
    }
    
    
    
}
