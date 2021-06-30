//
//  CreateRequestResponse.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 30/06/2021.
//

import Foundation

class CreateRequestResponse: Decodable {
    let response: CreateRequestResponseResponse
}

class CreateRequestResponseResponse: Decodable {
    let message: String
}
