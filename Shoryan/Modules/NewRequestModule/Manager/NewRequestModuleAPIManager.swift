//
//  NewRequestModuleAPIManager.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 28/06/2021.
//

import Foundation

class NewRequestModuleAPIManager {
    static func canUserCreateRequest(accessToken: String, completionHandler: @escaping (Result<BloodBanksResponse, NetworkError>) -> ()){
        
        Network.loadJSONFile(fromURL: Constants.endPoint, path: Constants.canUserCreateDonationPath, token: accessToken, method: .GET, type: BloodBanksResponse.self) { (result) in
            completionHandler(result)
        }
    }
    
    static func createNewrequest(accessToken: String, bloodType: String, numberOfBagsRequired: Int, donationLocation: String, completionHandler: @escaping (Result<CreateRequestResponse, NetworkError>) -> ()){
        
        let parameters = "{\r\n    \"bloodType\": \"\(bloodType)\",\r\n    \"numberOfBagsRequired\": \(numberOfBagsRequired),\r\n    \"urgent\": false,\r\n    \"donationLocation\": \"\(donationLocation)\"\r\n}"
        Network.loadJSONFile(fromURL: Constants.endPoint, path: Constants.createNewRequestPath, parameters: parameters, token: accessToken, method: .POST, type: CreateRequestResponse.self) { (result) in
            completionHandler(result)
        }
    }
}
