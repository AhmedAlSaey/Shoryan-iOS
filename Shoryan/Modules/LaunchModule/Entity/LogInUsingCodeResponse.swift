//
//  LogInSMSResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 02/06/2021.
//

import Foundation

class LoginUsingCodeResponse: Decodable {
    let accessToken: String
    let refreshToken: String
}
