//
//  DetailedRewardResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 26/06/2021.
//

import Foundation

class DetailedRewardResponse: Decodable {
    let successfulResponse: SuccessDetailedRewardResponse
}

class SuccessDetailedRewardResponse: Decodable {
    let reward: DetailedRewardResponseReward
    let isRedeemingThisReward: Bool
}

class DetailedRewardResponseReward: Decodable {
    let _id: String
    let description: String
    let requiredPoints: Int
    let store: DetailedRewardResponseStore
    let code: String
    let __v: Int
}

class DetailedRewardResponseStore: Decodable {
    let branches: DetailedRewardResponseBranch
    let _id: String
    let name: String
    let cover: String
    let logo: String
}

class DetailedRewardResponseBranch: Decodable {
    let location: DetailedRewardResponseLocation
    let _id: String
}

class DetailedRewardResponseLocation: Decodable {
    let governorate: String
    let region: String
    let streetName: String
    let buildingNumber: Int
}
