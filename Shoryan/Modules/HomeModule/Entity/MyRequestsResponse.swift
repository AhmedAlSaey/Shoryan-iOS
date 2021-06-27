//
//  MyRequestsResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/06/2021.
//

import Foundation

class MyRequestsResponse: Decodable {
    let activeRequests: [MyRequestsResponseRequest]
}

class MyRequestsResponseRequest: Decodable {
    let _id: String
    let bloodType: String
    let requestBy: MyRequestsResponseRequester
    let donationLocation: MyRequestsResponseDonationLocation
}

class MyRequestsResponseRequester: Decodable {
    let name: String
}

class MyRequestsResponseDonationLocation: Decodable {
    let location: MyRequestsResponseLocation
    let name: String
}

class MyRequestsResponseLocation: Decodable {
    let region: String
}
