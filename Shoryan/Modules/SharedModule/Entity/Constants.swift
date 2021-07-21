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
            return "https://shoryan.herokuapp.com"
        default:
            fatalError("Undefined endpoint")
        }
    }
    
    static let loginPath = "/api/users/login"
    static let signupPath = "/api/users/signup"
    static let allRequestsPath = "/api/requests"
    static let addUserToRequestPath = "/api/requests/"
    static let addPotentialDonorPath = "/api/requests/%@/user-potential-donation" // RequestID
    static let removePotentialDonorPath = "/api/requests/%@/user-potential-donation" // RequestID
    static let confirmPotentialDonorPath = "/api/requests/%@/user-donation" // RequestID, UserID
    static let loginRequestCodePath = "/api/users/login-send-code"
    static let loginUsingCodePath = "/api/users/login-sms"
    static let verifyAccountPath = "/api/users/signup-verification"
    static let getUserDataPath = "/api/users"
    static let getSpecificRequestPath = "/api/requests/%@/user-donation" //Request ID
    static let pendingRequestPath = "/api/users/pending-donations"
    static let allRewardsPath = "/api/rewards"
    static let detailedRewardPath = "/api/rewards/%@" //Reward ID
    static let redeemRewardPath = "/api/rewards/%@/redeemReward" //Reward ID
    static let redeemRewardValidationPath = "/api/rewards/%@/redeemRewardCodeVerification" //Reward ID
    static let myRequestsPath = "/api/users/active-requests"
    static let canUserCreateDonationPath = "/api/requests/request-creation-details"
    static let createNewRequestPath = "/api/requests/request-creation"
    static let editAccountInfoPath = "/api/users/profile"
    
    static let userIDKey = "USER_ID"
    static let accessTokenKey = "ACCESS_TOKEN"
    static let pendingRequestIDKey = "PENDING_REQUEST"
    static let bloodTypeKey = "BLOOD_TYPE"
    static let pointsKey = "POINTS"
    static let donationsKey = "DONATIONS"
    static let firstNameKey = "FIRST_NAME"
    static let lastNameKey = "LAST_NAME"
    static let birthDayKey = "BIRTH_DAY"
    static let birthMonthKey = "BIRTH_MONTH"
    static let birthYearKey = "BIRTH_YEAR"
    static let governorateKey = "GOVERNANCE"
    static let regionKey = "REGION"
    static let latKey = "LATITUDE"
    static let longKey = "LOGITUDE"
    static let genderKey = "GENDER"
}
