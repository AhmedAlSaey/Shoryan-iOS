//
//  AllRewardsResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 26/06/2021.
//

import Foundation

class AllRewardsResponse: Decodable {
    var rewards: [AllRewardsRewardResponse]
}

class AllRewardsRewardResponse: Decodable {
    var _id: String
    var requiredPoints: Int
    var store: AllRewardsStoreResponse
}

class AllRewardsStoreResponse: Decodable {
    var _id: String
    var logo: String
}

