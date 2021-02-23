//
//  LaunchInteractor.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//  
//

import Foundation

class LaunchInteractor {
    
    static let shared = LaunchInteractor()
    

    
    func isUserSignedIn() -> Bool {
        return false
    }
    
    func initializeApp() {
        ThemeConstants.globalApplicationTheming()
    }
    
    func logInWithPassword(phoneNumber: String, password: String, successHandler: () -> (), failHandler: () -> ()){
        successHandler()
    }
    
    func logInWithCode(phoneNumber: String, code: String, successHandler: () -> (), failHandler: () -> ()){
        successHandler()
    }
    
    func signUp(fullName: String, phoneNumber: String, birthDate: String, bloodType: String, address: String, password: String, passwordConfirmation: String, successHandler: () -> (), failHandler: () -> ()){
        successHandler()
    }
    
    func getBloodTypes() -> [String] {
        return ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]
    }

}
