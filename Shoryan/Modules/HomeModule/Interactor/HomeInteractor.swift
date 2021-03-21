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
    
    func getOngoingRequestsList(completionHandler: @escaping (Result<[SimpleRequest], NetworkError>) -> ()){
        HomeModuleAPIManager.listAllRequests { (result) in
            completionHandler(result.map { (successResponse) -> [SimpleRequest] in
                let simpleRequests = successResponse.map { (donationRequest) -> SimpleRequest in
                    let simpleRequest: SimpleRequest = SimpleRequest(name: donationRequest.requestBy?.name.firstName ?? "", bloodType: donationRequest.bloodType, location: donationRequest.donationLocation.location.region)
                    return simpleRequest
                }
                return simpleRequests
            })
        }
    }
    
    func getPendingRequest() {
        
    }
    
    
    

}
