//
//  GetUserIDResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 22/06/2021.
//

import Foundation

class GetUserDataResponse: Decodable {
    var user: GetUserDataResponseUser
}

class GetUserDataResponseUser: Decodable {
    var _id: String
    var bloodType: String
    var points: Int
    var numberOfDonations: Int
}
