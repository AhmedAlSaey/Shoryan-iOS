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
    
    var points: Int? {
        get {
            return UserDefaults.standard.integer(forKey: Constants.pointsKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.pointsKey)
        }
    }
    
    var donations: Int? {
        get {
            return UserDefaults.standard.integer(forKey: Constants.donationsKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.donationsKey)
        }
    }
    
    var firstName: String? {
        get {
            return UserDefaults.standard.string(forKey: Constants.firstNameKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.firstNameKey)
        }
    }
    
    var lastName: String? {
        get {
            return UserDefaults.standard.string(forKey: Constants.lastNameKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.lastNameKey)
        }
    }
    
    var birthDay: Int? {
        get {
            return UserDefaults.standard.integer(forKey: Constants.birthDayKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.birthDayKey)
        }
    }
    
    var birthMonth: Int? {
        get {
            return UserDefaults.standard.integer(forKey: Constants.birthMonthKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.birthMonthKey)
        }
    }
    
    var birthYear: Int? {
        get {
            return UserDefaults.standard.integer(forKey: Constants.birthYearKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.birthYearKey)
        }
    }
    
    var governorate: String? {
        get {
            return UserDefaults.standard.string(forKey: Constants.governorateKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.governorateKey)
        }
    }
    
    var region: String? {
        get {
            return UserDefaults.standard.string(forKey: Constants.regionKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.regionKey)
        }
    }
    
    var lat: Double? {
        get {
            return UserDefaults.standard.double(forKey: Constants.latKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.latKey)
        }
    }
    
    var long: Double? {
        get {
            return UserDefaults.standard.double(forKey: Constants.longKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.longKey)
        }
    }
    
    
    // M or F
    var genderKey: String? {
        get {
            return UserDefaults.standard.string(forKey: Constants.genderKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.genderKey)
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
        userID = nil
        accessToken = nil
        pendingRequestID = nil
        bloodType = nil
        points = nil
        donations = nil
        firstName = nil
        lastName = nil
    }
    
}
