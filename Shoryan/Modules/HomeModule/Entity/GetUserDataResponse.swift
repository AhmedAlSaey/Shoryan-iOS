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
    var name: GetUserDataResponseName
    var _id: String
    var bloodType: String
    var points: Int
    var numberOfDonations: Int
}

class GetUserDataResponseName: Decodable {
    var firstName: String
    var lastName: String
}
