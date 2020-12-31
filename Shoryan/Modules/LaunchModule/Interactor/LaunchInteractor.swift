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
    
    func signUp(successHandler: () -> (), failHandler: () -> ()){
        successHandler()
    }

}
