//
//  SharedModuleAPIManager.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 21/03/2021.
//

import Foundation
class SharedModuleAPIManager {
    static func getSpecificRequest(requestID: String, userID: String, completionHandler: @escaping (Result<SpecificRequestResponse, NetworkError>) -> ()){
        let path = "/api/requests/\(requestID)/user-donation/\(userID)"
        Network.loadJSONFile(fromURL: Constants.endPoint, path: path, method: .GET, type: SpecificRequestResponse.self, completionHandler: { result in
            completionHandler(result)
        })
    }
    
    static func registerUserAsDonor(requestID: String, userID: String, completionHandler: @escaping (Result<RequestUpdateResponse, NetworkError>) -> ()) {
        let path = String(format: Constants.addPotentialDonorPath, requestID, userID)
        Network.loadJSONFile(fromURL: Constants.endPoint, path: path, method: .POST, type: RequestUpdateResponse.self, completionHandler: { result in
            completionHandler(result)
        })
    }
    
    static func removeUserAsDonor(requestID: String, userID: String, completionHandler: @escaping (Result<RequestUpdateResponse, NetworkError>) -> ()) {
        let path = String(format: Constants.removePotentialDonorPath, requestID, userID)
        Network.loadJSONFile(fromURL: Constants.endPoint, path: path, method: .DEL, type: RequestUpdateResponse.self, completionHandler: { result in
            completionHandler(result)
        })
    }
    
    static func confirmUserAsDonor(requestID: String, userID: String, completionHandler: @escaping (Result<RequestUpdateResponse, NetworkError>) -> ()) {
        let path = String(format: Constants.confirmPotentialDonorPath, requestID, userID)
        Network.loadJSONFile(fromURL: Constants.endPoint, path: path, method: .POST, type: RequestUpdateResponse.self, completionHandler: { result in
            completionHandler(result)
        })
    }
}
