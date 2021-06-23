//
//  HomeModuleAPIManager.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 21/03/2021.
//

import Foundation


class HomeModuleAPIManager {
    static func getUserID(accessToken: String, completionHandler: @escaping (Result<GetUserIDResponse, NetworkError>) -> ()){
        
        Network.loadJSONFile(fromURL: Constants.endPoint, path: Constants.getUserDataPath, token: accessToken, method: .GET, type: GetUserIDResponse.self) { (result) in
            completionHandler(result)
        }
    }
    
    static func listAllRequests(accessToken: String, completionHandler: @escaping (Result<AllRequestsResponse, NetworkError>) -> ()){
        
        Network.loadJSONFile(fromURL: Constants.endPoint, path: Constants.allRequestsPath, token: accessToken, method: .GET, type: AllRequestsResponse.self) { (result) in
            completionHandler(result)
        }
        
    }
    
    static func getPendingRequest(accessToken: String, completionHandler: @escaping (Result<PendingRequestResponse, NetworkError>) -> ()){
        
        Network.loadJSONFile(fromURL: Constants.endPoint, path: Constants.pendingRequestPath, token: accessToken, method: .GET, type: PendingRequestResponse.self) { (result) in
            completionHandler(result)
        }
        
    }
    
}
