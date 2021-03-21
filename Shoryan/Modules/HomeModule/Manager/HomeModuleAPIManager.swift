//
//  HomeModuleAPIManager.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 21/03/2021.
//

import Foundation


class HomeModuleAPIManager {
    static func listAllRequests(completionHandler: @escaping (Result<[AllRequestsResponse], NetworkError>) -> ()){
        
        Network.loadJSONFile(fromURL: Constants.endPoint, path: Constants.allRequestsPath, method: .GET, type: [AllRequestsResponse].self) { (result) in
            completionHandler(result)
        }
        
    }
    
}
