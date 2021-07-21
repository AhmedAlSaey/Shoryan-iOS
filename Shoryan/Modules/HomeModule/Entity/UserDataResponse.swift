//
//  GetUserIDResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 22/06/2021.
//

import Foundation

class UserDataResponse: Decodable {
    var user: UserDataResponseUser
}

class UserDataResponseUser: Decodable {
    var name: UserDataResponseName
    var location: UserDataResponseLocation
    var birthDate: UserDataResponseBirthDate
    var _id: String?
    var bloodType: String
    var points: Int
    var numberOfDonations: Int?
    var gender: String
}

class UserDataResponseName: Decodable {
    var firstName: String
    var lastName: String
}

class UserDataResponseLocation: Decodable {
    var governorate: String
    var region: String
    var latitude: Double
    var longitude: Double
}

class UserDataResponseBirthDate: Decodable {
    var year: Int
    var month: Int
    var day: Int
}
