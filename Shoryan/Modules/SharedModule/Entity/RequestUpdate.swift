//
//  RequestUpdate.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 22/03/2021.
//

import Foundation

class RequestUpdate {
    //TODO: - Clean this
    let donatorsCount: Int
    let bloodBagsCount: Int
//    let isActive: Bool
    let bloodType: String
    let canUserDonate: Bool
    let donationPreventionReason: String?
    
    init(donatorsCount: Int, bloodBagsCount: Int, bloodType: String, canUserDonate: Bool, donationPreventionReason: String? = nil) {
        self.donatorsCount = donatorsCount
        self.bloodBagsCount = bloodBagsCount
//        self.isActive = isActive
        self.bloodType = bloodType
        self.canUserDonate = canUserDonate
        self.donationPreventionReason = donationPreventionReason
    }
}
