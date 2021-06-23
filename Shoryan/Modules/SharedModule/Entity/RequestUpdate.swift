//
//  RequestUpdate.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 22/03/2021.
//

import Foundation

class RequestUpdate {
    
    let donatorsCount: Int
    let bloodBagsCount: Int
    let isActive: Bool
    let bloodType: String
    
    init(donatorsCount: Int, bloodBagsCount: Int, isActive: Bool, bloodType: String) {
        self.donatorsCount = donatorsCount
        self.bloodBagsCount = bloodBagsCount
        self.isActive = isActive
        self.bloodType = bloodType
    }
}
