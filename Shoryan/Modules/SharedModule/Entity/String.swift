//
//  String.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 29/12/2020.
//

import Foundation

extension Optional where Wrapped == String {
    var nonNullString: String {
        get {
            self ?? ""
        }
    }
}
