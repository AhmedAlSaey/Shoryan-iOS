//
//  Appuser.swift
//  BI Premier League
//
//  Created by Ahmed AlSai on 26/02/2021.
//

import Foundation

class AppUser {
    
    static let shared = AppUser()
    var userID : String? {
        get {
            return KeyChain.shared[Constants.userIDKey]
        }
        set {
            KeyChain.shared[Constants.userIDKey] = newValue
        }
    }
    var accessToken : String? {
        get {
            KeyChain.shared[Constants.accessTokenKey]
        }
    }
    
    var pendingRequestID: String? {
        get {
            return KeyChain.shared[Constants.pendingRequestIDKey]
        }
        set {
            KeyChain.shared[Constants.pendingRequestIDKey] = newValue
        }
    }

    func isUserAuthenticated() -> Bool {
        return userID != nil
    }
    
    func saveNewUserAcessTokens(userData: LoginPasswordResponse) {
        KeyChain.shared[Constants.accessTokenKey] = userData.accessToken
    }
    
    func saveNewUserAcessTokens(userData: LoginUsingCodeResponse) {
        KeyChain.shared[Constants.accessTokenKey] = userData.accessToken
    }
    
    func saveNewUserAcessTokens(userData: VerifyAccountResponse) {
        KeyChain.shared[Constants.accessTokenKey] = userData.accessToken
    }
    
    func clearUserData() {
        KeyChain.shared[Constants.accessTokenKey] = nil
        KeyChain.shared[Constants.userIDKey] = nil
    }
    
}
