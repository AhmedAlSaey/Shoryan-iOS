//
//  RedeemRewardResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 26/06/2021.
//

import Foundation

class RedeemRewardResponse: Decodable {
    let response: RedeemRewardResponseMessage
}

class RedeemRewardResponseMessage: Decodable {
    let message: String
}
