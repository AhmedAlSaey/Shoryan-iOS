//
//  AllRequestsResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 21/03/2021.
//

import Foundation

class SpecificRequestResponse: Decodable {
    let error: SpecificRequestRespnseError?
    let request: SpecificRequest
}

//TODO: - Clean this
class SpecificRequest: Decodable {
    let numberOfBagsFulfilled: Int
    let numberOfComingDonors: Int
//    let isActive: Bool
//    let comingDonors: [String]
    let _id: String
    let bloodType: String
    let numberOfBagsRequired: Int
    let requestBy: SpecificRequestRequester
    let requestByModelReference: String
    let urgent: Bool
    let donationLocation: SpecificRequestDonationLocation
//    let date: String
//    let donations: [SpecificRequestDonation]
}

class SpecificRequestRespnseError: Decodable {
    let status: Int
    let message: String
}

class SpecificRequestRequester: Decodable {
    let name: String
    let _id: String
    let phoneNumber: String
}

class SpecificRequestDonationLocation: Decodable {
    let location: SpecificRequestLocation
    let phoneNumber: String
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
