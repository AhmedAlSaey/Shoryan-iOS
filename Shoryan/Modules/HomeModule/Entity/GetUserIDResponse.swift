//
//  GetUserIDResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 22/06/2021.
//

import Foundation

class GetUserIDResponse: Decodable {
    var user: GetUserIDResponseUser
}

class GetUserIDResponseUser: Decodable {
    var _id: String
}
