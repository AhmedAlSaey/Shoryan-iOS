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
            return UserDefaults.standard.string(forKey: Constants.userIDKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.userIDKey)
        }
    }
    var accessToken : String? {
        get {
            KeyChain.shared[Constants.accessTokenKey]
        }
        set {
            KeyChain.shared[Constants.accessTokenKey] = newValue
        }
    }
    
    var pendingRequestID: String? {
        get {
            return UserDefaults.standard.string(forKey: Constants.pendingRequestIDKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.pendingRequestIDKey)
        }
    }
    
    var bloodType: String? {
        get {
            return UserDefaults.standard.string(forKey: Constants.bloodTypeKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.bloodTypeKey)
        }
    }

    func isUserAuthenticated() -> Bool {
        return accessToken != nil
    }
    
    func saveNewUserAcessTokens(userData: LoginPasswordResponse) {
        accessToken = userData.accessToken
    }
    
    func saveNewUserAcessTokens(userData: LoginUsingCodeResponse) {
        accessToken = userData.accessToken
    }
    
    func saveNewUserAcessTokens(userData: VerifyAccountResponse) {
        accessToken = userData.accessToken
    }
    
    func clearUserData() {
        accessToken = nil
        userID = nil
    }
    
}
