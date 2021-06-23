//
//  AddDonorResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 22/03/2021.
//

import Foundation

class RequestUpdateResponse: Decodable {
    let numberOfBagsFulfilled: Int
    let numberOfComingDonors: Int
    let isActive: Bool
    let comingDonors: [String]
    let _id: String
    let bloodType: String
    let numberOfBagsRequired: Int
    let urgent: Bool
    let requestBy: String
    let donationLocation: String
    let date: String
    let __v: Int
}
