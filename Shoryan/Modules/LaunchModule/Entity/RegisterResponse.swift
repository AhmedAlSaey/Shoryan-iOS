//
//  RegisterResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 21/03/2021.
//

import Foundation

class RegisterResponse: Decodable {
    let name: RegisterName
    let _id: String
}

class RegisterName: Decodable {
    let firstName: String
    let lastName: String
}
