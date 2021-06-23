//
//  RegisterResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 21/03/2021.
//

import Foundation

class RegisterResponse: Decodable {
    let response: RegisterMessage
}

class RegisterMessage: Decodable {
    let message: String
}
