//
//  BaseError.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//

import Foundation

class BaseError : Error {
    var message : String?
    var code : Int?
    
    init() {
        
    }
    
    convenience init(message : String) {
        self.init(code: 0, message: message)
    }

    init(code : Int = 0, message : String = "") {
        if code > 0 {
            self.code = code
        }
        if message.count > 0 {
            self.message = message
        }
        
    }
    
}


