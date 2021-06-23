//
//  AllRequestsResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 21/03/2021.
//

import Foundation

class AllRequestsResponse: Decodable {
    let requests: [AllRequestsResponseRequest]
    
}

class AllRequestsResponseRequest: Decodable {
    let _id: String
    let bloodType: String
    let requestBy: AllRequestsRequester?
    let donationLocation: AllRequestsDonationLocation
    let urgent: Bool?
}

class AllRequestsRequester: Decodable {
    let name: String
    let _id: String
}


class AllRequestsDonationLocation: Decodable {
    let location: AllRequestsLocation
    let _id: String
    let name: String
}

class AllRequestsLocation: Decodable {
    let region: String
}
