//
//  AllRequestsResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 21/03/2021.
//

import Foundation

class SpecificRequestResponse: Decodable {
    let request: SpecificRequest
    let userCanDonate: SpecificRequestUserCanDonate
}

class SpecificRequest: Decodable {
    let numberOfBagsFulfilled: Int
    let numberOfComingDonors: Int
    let isActive: Bool
    let comingDonors: [String]
    let _id: String
    let bloodType: String
    let numberOfBagsRequired: Int
    let urgent: Bool
    let requestBy: SpecificRequestRequester
    let donationLocation: SpecificRequestDonationLocation
    let date: String
    let donations: [SpecificRequestDonation]
    let __v: Int
}

class SpecificRequestRequester: Decodable {
    let name: SpecificRequestRequesterName
    let _id: String
    let phoneNumber: Int
}

class SpecificRequestRequesterName: Decodable {
    let firstName: String
    let lastName: String
}

class SpecificRequestDonationLocation: Decodable {
    let location: SpecificRequestLocation
    let phoneNumber: [Int]
    let _id: String
    let name: String
    let __v: Int
}
class SpecificRequestLocation: Decodable {
    let governorate: String
    let region: String
    let streetName: String
    let buildingNumber: Int
    let latitude: Double
    let longitude: Double
}

class SpecificRequestUserCanDonate: Decodable {
    let state: Bool
    let message: String?
}

class SpecificRequestDonation: Decodable {
    let _id: String
    let user: SpecificRequestDonator
    let donationTime: String
}

class SpecificRequestDonator: Decodable {
    let name: SpecificRequestDonatorName
    let _id: String
}

class SpecificRequestDonatorName: Decodable {
    let firstName: String
    let lastName: String
}
