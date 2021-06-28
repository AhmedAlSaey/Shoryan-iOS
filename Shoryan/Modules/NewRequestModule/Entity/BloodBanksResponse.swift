//
//  BloodBanksResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 28/06/2021.
//

import Foundation

class BloodBanksResponse: Decodable {
    let bloodBanks: [BloodBanksResponseBloodBank]
    
}

class BloodBanksResponseBloodBank: Decodable {
    let location: BloodBanksResponseLocation
    let _id: String
    let name: String
}

class BloodBanksResponseLocation: Decodable {
    let governorate: String
    let region: String
    let streetName: String
    let buildingNumber: Int
    let latitude: Double
    let longitude: Double
}

