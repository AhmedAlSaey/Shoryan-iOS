//
//  AddDonorResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 22/03/2021.
//

import Foundation

class RequestUpdateResponse: Decodable {
    let request: RequestUpdateRequest
    let error: RequestUpdateResppnseError?
}

class RequestUpdateResppnseError: Decodable {
    let status: Int
    let message: String
}


//TODO: - Clean this
class RequestUpdateRequest: Decodable {
    let numberOfBagsFulfilled: Int
    let numberOfComingDonors: Int
//    let isActive: Bool
//    let comingDonors: [String]
    let _id: String
    let bloodType: String
    let numberOfBagsRequired: Int
    let requestBy: RequestUpdateRequester
    let requestByModelReference: String
    let urgent: Bool
    let donationLocation: RequestUpdateDonationLocation
//    let date: String
//    let donations: [SpecificRequestDonation]
}



class RequestUpdateRequester: Decodable {
    let name: String
    let _id: String
    let phoneNumber: String
}

class RequestUpdateDonationLocation: Decodable {
    let location: RequestUpdateExactDonationLocation
    let phoneNumber: String
    let _id: String
    let name: String
    let __v: Int
}
class RequestUpdateExactDonationLocation: Decodable {
    let governorate: String
    let region: String
    let streetName: String
    let buildingNumber: Int
    let latitude: Double
    let longitude: Double
}

