//
//  SimpleReward.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 25/07/2021.
//

import Foundation

class SimpleReward {
    internal init(imageURL: String, pointCost: Int, id: String) {
        self.imageURL = imageURL
        self.pointCost = pointCost
        self.id = id
    }
    
    var imageURL: String
    var pointCost: Int
    var id: String
}
