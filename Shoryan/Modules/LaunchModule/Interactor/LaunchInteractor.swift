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
}
