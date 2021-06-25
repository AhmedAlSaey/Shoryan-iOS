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

extension String {
    public var localizeDigits: String {
        let langStr = Locale.current.languageCode
        if langStr == "ar" {
            return enToArDigits
        }
        else {
            return arToEnDigits
        }
    }
    private var arToEnDigits : String {
        let arabicNumbers = ["٠": "0","١": "1","٢": "2","٣": "3","٤": "4","٥": "5","٦": "6","٧": "7","٨": "8","٩": "9"]
        var txt = self
        arabicNumbers.map { txt = txt.replacingOccurrences(of: $0, with: $1)}
        return txt
    }
    
    private var enToArDigits : String {
        let englishNumbers = ["0": "٠",
                             "1": "١",
                             "2": "٢",
                             "3": "٣",
                             "4": "٤",
                             "5": "٥",
                             "6": "٦",
                             "7": "٧",
                             "8": "٨",
                             "9": "٩"]
        var txt = self
        englishNumbers.map { txt = txt.replacingOccurrences(of: $0, with: $1)}
        return txt
    }
}
