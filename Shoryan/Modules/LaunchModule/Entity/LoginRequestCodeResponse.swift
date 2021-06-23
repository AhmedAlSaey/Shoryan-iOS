//
//  LoginCodeResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 02/06/2021.
//

import Foundation

class LoginRequestCodeResponse: Decodable {
    var response: LoginRequestCodeResponseResponse
}

class LoginRequestCodeResponseResponse: Decodable {
    var message: String
}
