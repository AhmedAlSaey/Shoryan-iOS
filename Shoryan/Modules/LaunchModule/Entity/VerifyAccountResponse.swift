//
//  VerifyAccountResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 07/06/2021.
//

import Foundation

class VerifyAccountResponse : Decodable {
    let accessToken: String
    let refreshToken: String
}
