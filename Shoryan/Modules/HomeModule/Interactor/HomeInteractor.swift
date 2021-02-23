//
//  HomeInteractor.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//


import Foundation

class HomeInteractor: BaseInteractor{
    
    static let shared = HomeInteractor()
    
    func loadHomeData(){
        
    }
    
    func getOngoingRequestsList() -> [SimpleRequest]{
        var requests = [SimpleRequest]()
        
        for _ in 1...5 {
            let request = SimpleRequest(name: "Sherif", bloodType: "O+", location: "Nasr City")
            requests.append(request)
        }
        
        return requests
    }
    
    func getPendingRequest() {
        
    }
    
    
    

}
