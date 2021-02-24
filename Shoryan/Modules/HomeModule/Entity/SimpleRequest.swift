//
//  SimpleRequest.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import Foundation

class SimpleRequest {
    var name: String
    var bloodType: String
    var location: String
    
    
    init(name: String, bloodType: String, location: String) {
        self.name = name
        self.bloodType = bloodType
        self.location = location
    }
}
