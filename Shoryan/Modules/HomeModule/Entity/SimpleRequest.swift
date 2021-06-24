//
//  SimpleRequest.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import Foundation

enum Requester {
    case BloodBank
    case User
}

class SimpleRequest {
    var name: String
    var bloodType: String
    var location: String
    var _id: String
    var urgent: Bool
    var requester: Requester
    
    init(name: String, bloodType: String, location: String, _id: String, urgent: Bool, requester: Requester) {
        self.name = name
        self.bloodType = bloodType
        self.location = location
        self._id = _id
        self.urgent = urgent
        self.requester = requester
    }
}
