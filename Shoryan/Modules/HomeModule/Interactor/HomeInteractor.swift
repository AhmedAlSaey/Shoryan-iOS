//
//  HomeInteractor.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//


import Foundation

class HomeInteractor {
    
    static let shared = HomeInteractor()
    
    func getRequestList() -> [SimpleRequest]{
        var requests = [SimpleRequest]()
        
        for _ in 1...5 {
            let request = SimpleRequest(name: "Sherif", bloodType: "O+", location: "Nasr City")
            requests.append(request)
        }
        
        return requests
    }
    

}
