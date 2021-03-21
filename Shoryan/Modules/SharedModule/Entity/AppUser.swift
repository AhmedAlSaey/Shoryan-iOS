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

    func isUserAuthenticated() -> Bool {
        return userID != nil
    }
    
    func saveNewUserAcessTokens(userData: LoginPasswordResponse) {
        KeyChain.shared[Constants.userIDKey] = userData.user._id
    }
    
    func saveNewUserAcessTokens(userData: RegisterResponse) {
        KeyChain.shared[Constants.userIDKey] = userData._id
    }
    
    func clearUserData() {
        KeyChain.shared[Constants.userIDKey] = nil
    }
    
}
