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
    var _id: String
    
    init(name: String, bloodType: String, location: String, _id: String) {
        self.name = name
        self.bloodType = bloodType
        self.location = location
        self._id = _id
    }
}
