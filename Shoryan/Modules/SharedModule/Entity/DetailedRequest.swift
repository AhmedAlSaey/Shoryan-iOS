//
//  SpecificRequest.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 21/03/2021.
//

import Foundation

class DetailedRequest {
    var lng: Double
    var lat: Double
    var fullName: String
    var address: String
    var bloodBags: Int
    var donatorsCount: Int
    var bloodType: String
    var isUserRequest: Bool
    var isUserADonator: Bool
    var _id: String
    
    
    init(lng: Double, lat: Double, fullName: String, address: String, bloodBags: Int, donatorsCount: Int, bloodType: String, isUserRequest: Bool, isUserADonator: Bool, _id: String) {
        self.lng = lng
        self.lat = lat
        self.fullName = fullName
        self.address = address
        self.bloodBags = bloodBags
        self.donatorsCount = donatorsCount
        self.bloodType = bloodType
        self.isUserRequest = isUserRequest
        self.isUserADonator = isUserADonator
        self._id = _id
    }
    
}
