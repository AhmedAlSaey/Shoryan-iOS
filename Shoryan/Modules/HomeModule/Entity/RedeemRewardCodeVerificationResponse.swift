//
//  RedeemRewardCodeVerificationResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 25/07/2021.
//

import Foundation

class RedeemRewardCodeVerificationResponse: Decodable {
    var response: RedeemRewardCodeVerificationResponseResponse
    var user: RedeemRewardCodeVerificationResponseUser
}

class RedeemRewardCodeVerificationResponseResponse: Decodable {
    var message: String
}

class RedeemRewardCodeVerificationResponseUser: Decodable {
    var points: Int
}
