//
//  Constants.swift
//  BI Premier League
//
//  Created by Ahmed AlSai on 12/03/2021.
//

import Foundation
enum ApplicationState {
    case production
    case development
}

class Constants {
    
    static private let appState: ApplicationState = .production
    static var endPoint : String {
        switch appState {
        case .production:
            return "https://pacific-springs-77989.herokuapp.com"
        default:
            fatalError("Undefined endpoint")
        }
    }
    
    static let loginPath = "/api/users/login"
    static let signupPath = "/api/users/signup"
    static let allRequestsPath = "/api/requests"
    static let addUserToRequestPath = "/api/requests/"
    
    static let userIDKey = "USER_ID"
}
