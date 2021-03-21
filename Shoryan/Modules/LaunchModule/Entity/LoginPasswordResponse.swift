//
//  LoginPasswordResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 21/03/2021.
//

import Foundation

class LoginPasswordResponse: Decodable {
    let state: Bool
    let user: LoginUser
}

class LoginUser: Decodable {
    let name: LoginUser
    let points: Int
    let _id: String
    let bloodType: String
}

class LogInName: Decodable {
    let firstName: String
    let lastName: String
}
