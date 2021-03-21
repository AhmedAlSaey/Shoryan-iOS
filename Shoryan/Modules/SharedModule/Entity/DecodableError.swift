//
//  BIPLDecodableError.swift
//  BI Premier League
//
//  Created by Ahmed AlSai on 11/03/2021.
//

import Foundation


class DecodableErrorResponse : Decodable {
    let error: DecodableErrorData
}

class DecodableErrorData: Decodable {
    let status: Int
    let message: String
}
