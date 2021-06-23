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
    static let addPotentialDonorPath = "/api/requests/%@/user-potential-donation/%@" // RequestID, UserID
    static let removePotentialDonorPath = "/api/requests/%@/user-potential-donation/%@" // RequestID, UserID
    static let confirmPotentialDonorPath = "/api/requests/%@/user-donation/%@" // RequestID, UserID
    static let loginRequestCodePath = "/api/users/login-send-code"
    static let loginUsingCodePath = "/api/users/login-sms"
    static let verifyAccountPath = "/api/users/signup-verification"
    static let getUserDataPath = "/api/users"
    
    
    static let pendingRequestPath = "/users/pending-donations" 
    static let userIDKey = "USER_ID"
    static let accessTokenKey = "ACCESS_TOKEN"
    static let pendingRequestIDKey = "PENDING_REQUEST"

}
