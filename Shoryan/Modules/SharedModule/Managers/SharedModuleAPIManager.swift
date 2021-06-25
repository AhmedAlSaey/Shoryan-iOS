//
//  SharedModuleAPIManager.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 21/03/2021.
//

import Foundation
class SharedModuleAPIManager {
    static func getSpecificRequest(accessToken: String, requestID: String, completionHandler: @escaping (Result<SpecificRequestResponse, NetworkError>) -> ()){
        let path = String(format: Constants.getSpecificRequestPath, requestID)
        Network.loadJSONFile(fromURL: Constants.endPoint, path: path, token: accessToken, method: .GET, type: SpecificRequestResponse.self, completionHandler: { result in
            completionHandler(result)
        })
    }
    
    static func registerUserAsDonor(requestID: String, accessToken: String, completionHandler: @escaping (Result<RequestUpdateResponse, NetworkError>) -> ()) {
        let path = String(format: Constants.addPotentialDonorPath, requestID)
        Network.loadJSONFile(fromURL: Constants.endPoint, path: path, token: accessToken, method: .POST, type: RequestUpdateResponse.self, completionHandler: { result in
            completionHandler(result)
        })
    }
    
    static func removeUserAsDonor(requestID: String, accessToken: String, completionHandler: @escaping (Result<RequestUpdateResponse, NetworkError>) -> ()) {
        let path = String(format: Constants.removePotentialDonorPath, requestID)
        Network.loadJSONFile(fromURL: Constants.endPoint, path: path, token: accessToken, method: .DEL, type: RequestUpdateResponse.self, completionHandler: { result in
            completionHandler(result)
        })
    }
    
    static func confirmUserAsDonor(requestID: String, accessToken: String, completionHandler: @escaping (Result<RequestUpdateResponse, NetworkError>) -> ()) {
        let path = String(format: Constants.confirmPotentialDonorPath, requestID)
        Network.loadJSONFile(fromURL: Constants.endPoint, path: path, token: accessToken, method: .POST, type: RequestUpdateResponse.self, completionHandler: { result in
            completionHandler(result)
        })
    }
}
