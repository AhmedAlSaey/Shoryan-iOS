//
//  RegExHandler.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 23/02/2021.
//

import Foundation

class RegExHandler {
    static func emailRegEx (text: String) -> Bool {
        let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        return evaluate(text: text, withRegEx: emailRegEx)
    }
    static func fairPasswordRegEx (text: String) -> Bool {
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$"
        return evaluate(text: text, withRegEx: passwordRegEx)
    }
    static func phoneNumberRegEx (text: String) -> Bool {
        let phoneNumberRegEx = "^01[0125][0-9]{8}$"
        return evaluate(text: text, withRegEx: phoneNumberRegEx)
    }
    static func notEmptyRegEx (text: String) -> Bool {
        let emptyRegEx = "^$|\\s+"
        return !evaluate(text: text, withRegEx: emptyRegEx)
    }
    static func nameRegEx (text: String) -> Bool {
        //TODO: - This is the not empty RegEx, fix it.
        let emptyRegEx = "^$|\\s+"
        return !evaluate(text: text, withRegEx: emptyRegEx)
    }
    
    static private func evaluate(text: String, withRegEx regEx : String) -> Bool{
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: text)
    }
    
    
}
