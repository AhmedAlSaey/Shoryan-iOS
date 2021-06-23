//
//  LoginPasswordResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 21/03/2021.
//

import Foundation

class LoginPasswordResponse: Decodable {
    let accessToken: String
    let refreshToken: String
}

