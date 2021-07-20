//
//  HomeModuleAPIManager.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 21/03/2021.
//

import Foundation


class HomeModuleAPIManager {
    static func getUserData(accessToken: String, completionHandler: @escaping (Result<GetUserDataResponse, NetworkError>) -> ()){
        
        Network.loadJSONFile(fromURL: Constants.endPoint, path: Constants.getUserDataPath, token: accessToken, method: .GET, type: GetUserDataResponse.self) { (result) in
            completionHandler(result)
        }
    }
    
    static func listAllRequests(accessToken: String, completionHandler: @escaping (Result<AllRequestsResponse, NetworkError>) -> ()){
        
        Network.loadJSONFile(fromURL: Constants.endPoint, path: Constants.allRequestsPath, token: accessToken, method: .GET, type: AllRequestsResponse.self) { (result) in
            completionHandler(result)
        }
        
    }
    
    static func getMyRequests(accessToken: String, completionHandler: @escaping (Result<MyRequestsResponse, NetworkError>) -> ()){
        
        Network.loadJSONFile(fromURL: Constants.endPoint, path: Constants.myRequestsPath, token: accessToken, method: .GET, type: MyRequestsResponse.self) { (result) in
            completionHandler(result)
        }
        
    }
    
    static func getPendingRequest(accessToken: String, completionHandler: @escaping (Result<PendingRequestResponse, NetworkError>) -> ()){
        
        Network.loadJSONFile(fromURL: Constants.endPoint, path: Constants.pendingRequestPath, token: accessToken, method: .GET, type: PendingRequestResponse.self) { (result) in
            completionHandler(result)
        }
        
    }
    
    static func getAllRewards(accessToken: String, completionHandler: @escaping (Result<AllRewardsResponse, NetworkError>) -> ()){
        
        Network.loadJSONFile(fromURL: Constants.endPoint, path: Constants.allRewardsPath, token: accessToken, method: .GET, type: AllRewardsResponse.self) { (result) in
            completionHandler(result)
        }
    }
    
    static func getDetailedReward(accessToken: String, rewardID: String, completionHandler: @escaping (Result<DetailedRewardResponse, NetworkError>) -> ()){
        
        let path = String(format: Constants.detailedRewardPath, rewardID)
        Network.loadJSONFile(fromURL: Constants.endPoint, path: path, token: accessToken, method: .GET, type: DetailedRewardResponse.self) { (result) in
            completionHandler(result)
        }
    }
    
    static func redeemReward(accessToken: String, rewardID: String, branchID: String, completionHandler: @escaping (Result<RedeemRewardResponse, NetworkError>) -> ()){
        let path = String(format: Constants.redeemRewardPath, rewardID)
        let parameters = "{\r\n    \"branchId\": \"\(branchID)\"\r\n}"
        Network.loadJSONFile(fromURL: Constants.endPoint, path: path, parameters: parameters, token: accessToken, method: .POST, type: RedeemRewardResponse.self) { (result) in
            completionHandler(result)
        }
    }
    
    static func redeemRewardCodeVerification(accessToken: String, rewardID: String, branchID: String, verificationCode: String, completionHandler: @escaping (Result<RedeemRewardCodeVerificationResponse, NetworkError>) -> ()){
        let path = String(format: Constants.redeemRewardValidationPath, rewardID)
        let parameters = "{\r\n    \"branchId\": \"\(branchID)\",\r\n    \"verificationCode\": \(verificationCode)\r\n}"
        Network.loadJSONFile(fromURL: Constants.endPoint, path: path, parameters: parameters, token: accessToken, method: .POST, type: RedeemRewardCodeVerificationResponse.self) { (result) in
            completionHandler(result)
        }
    }
}
