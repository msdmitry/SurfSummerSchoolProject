//
//  BaseTokenStorage.swift
//  SurfSummerSchoolProject
//
//  Created by Dmitry M. on 8/12/22.
//

import Foundation

struct BaseTokenStorage: TokenStorage {
    
    // MARK: - Nested Types
    
    private enum Constants {
        static let applicationNameInKeyChain = "com.surf.summerschool.project"
        static let tokenKey = "token"
        static let tokenDatekey = "tokenDate"
    }
    
    //MARK: - Private Properties
    
    private var unprotectedStorage: UserDefaults {
        UserDefaults.standard
    }
    
    //MARK: - Token Storage
    
    func getToken() throws -> TokenContainer {
        let queryDictionaryForSavingToken: [CFString: AnyObject] = [
            kSecAttrService: Constants.applicationNameInKeyChain as AnyObject,
            kSecAttrAccount: Constants.tokenKey as AnyObject,
            kSecClass: kSecClassGenericPassword,
            kSecMatchLimit: kSecMatchLimitOne,
            kSecReturnData: kCFBooleanTrue
        ]
        
        var tokenInResult: AnyObject?
        let status = SecItemCopyMatching(queryDictionaryForSavingToken as CFDictionary, &tokenInResult)
        
        try throwErrorFromStatusIfNeeded(status)
        
        guard let data = tokenInResult as? Data else {
            throw Error.tokenWasNotFoundInKeyChainOrCantRepresentUsData
        }

        //??? - можно было декодировать TokenContainer вместе с датой и не хранить в UserDefaults
        let retrivingToken = try JSONDecoder().decode(String.self, from: data)
        let tokenSavingDate = try getSavingTokenDate()
        
        return TokenContainer(token: retrivingToken, receivingDate: tokenSavingDate)
        
//        старый код, где вручную вписывали токен:
//        return TokenContainer(
//            token: "fc1aeeeb7eb1ff4650cc3b80fbb034ab4054daa33bbacfc428e90a3a138fff7f",
//            receivingDate: Date().addingTimeInterval(-40000)
//        )
    }
    
    func set(newToken: TokenContainer) throws {
        try removeTokenFromContainer()

        let tokenInData = try JSONEncoder().encode(newToken.token)
        let queryDictionaryForSavingToken: [CFString: AnyObject] = [
            kSecAttrService: Constants.applicationNameInKeyChain as AnyObject,
            kSecAttrAccount: Constants.tokenKey as AnyObject,
            kSecClass: kSecClassGenericPassword,
            kSecValueData: tokenInData as AnyObject
        ]
        
        let status = SecItemAdd(queryDictionaryForSavingToken as CFDictionary, nil)
        
        try throwErrorFromStatusIfNeeded(status)
        
        saveTokenSavingDate(.now)
    }
    
    func removeTokenFromContainer() throws {
        let queryDictionaryForDeleteToken: [CFString: AnyObject] = [
            kSecAttrService: Constants.applicationNameInKeyChain as AnyObject,
            kSecAttrAccount: Constants.tokenKey as AnyObject,
            kSecClass: kSecClassGenericPassword,
        ]
        
        let status = SecItemDelete(queryDictionaryForDeleteToken as CFDictionary)
        
        try throwErrorFromStatusIfNeeded(status)
        
        removeTokenSavingDate()
    }
    
}

private extension BaseTokenStorage {
    
    enum Error: Swift.Error {
        case unknownError(status: OSStatus)
        case keyIsAlreadyInKeyChain
        case tokenWasNotFoundInKeyChainOrCantRepresentUsData
        case tokenDateWasNotFound
    }
    
    func getSavingTokenDate() throws -> Date {
        guard let savingDate = unprotectedStorage.value(forKey: Constants.tokenDatekey) as? Date else {
            throw Error.tokenDateWasNotFound
        }
        return savingDate
    }
    
    func saveTokenSavingDate(_ newDate: Date) {
        unprotectedStorage.set(newDate, forKey: Constants.tokenDatekey)
    }
    
    func removeTokenSavingDate() {
        unprotectedStorage.set(nil, forKey: Constants.tokenDatekey)
    }
    
    func throwErrorFromStatusIfNeeded(_ status: OSStatus) throws {
        guard status == errSecSuccess || status == -25300 else {
            throw Error.unknownError(status: status)
        }
        guard status != -25299 else {
            throw Error.keyIsAlreadyInKeyChain
        }
    }
    
}
