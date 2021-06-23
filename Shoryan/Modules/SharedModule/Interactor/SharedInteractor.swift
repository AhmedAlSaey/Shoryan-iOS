//
//  RequestInteractor.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 22/03/2021.
//

import Foundation

class SharedInteractor: BaseInteractor {
    static let shared = SharedInteractor()
    
    func registerUserAsDonor (forRequest requestID: String, completionHandler: @escaping (Result<RequestUpdate, NetworkError>) -> ()) {
        SharedModuleAPIManager.registerUserAsDonor(requestID: requestID, userID: AppUser.shared.userID!) { (result) in
            completionHandler(result.map { (response) -> RequestUpdate in
                RequestUpdate(donatorsCount: response.numberOfComingDonors, bloodBagsCount: response.numberOfBagsRequired - response.numberOfBagsFulfilled, isActive: response.isActive, bloodType: response.bloodType)
            })
        }
    }
    
    func removeUserAsDonor (forRequest requestID: String, completionHandler: @escaping (Result<RequestUpdate, NetworkError>) -> ()) {
        SharedModuleAPIManager.removeUserAsDonor(requestID: requestID, userID: AppUser.shared.userID!) { (result) in
            completionHandler(result.map { (response) -> RequestUpdate in
                RequestUpdate(donatorsCount: response.numberOfComingDonors, bloodBagsCount: response.numberOfBagsRequired - response.numberOfBagsFulfilled, isActive: response.isActive, bloodType: response.bloodType)
            })
        }
    }
    
    func confirmUserAsDonor (forRequest requestID: String, completionHandler: @escaping (Result<RequestUpdate, NetworkError>) -> ()) {
        SharedModuleAPIManager.confirmUserAsDonor(requestID: requestID, userID: AppUser.shared.userID!) { (result) in
            completionHandler(result.map { (response) -> RequestUpdate in
                RequestUpdate(donatorsCount: response.numberOfComingDonors, bloodBagsCount: response.numberOfBagsRequired - response.numberOfBagsFulfilled, isActive: response.isActive, bloodType: response.bloodType)
            })
        }
    }
}

