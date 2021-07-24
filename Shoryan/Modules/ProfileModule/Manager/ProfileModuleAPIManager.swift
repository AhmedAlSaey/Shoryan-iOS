//
//  ProfileAPIManager.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 21/07/2021.
//

import Foundation

class ProfileModuleAPIManager {
    
    static func editUserInfo(accessToken: String, firstName: String, lastName: String, governorate: String, region: String, lat: Double, lng: Double, bloodType: String, gender: String, birthYear: Int, birthMonth: Int, birthDay: Int, simulatedDelay: Double?, completionHandler: @escaping (Result<UserDataResponse, NetworkError>) -> ()){
        let parameters = "{\r\n    \"name\":{\r\n        \"firstName\": \"\(firstName)\",\r\n        \"lastName\": \"\(lastName)\"\r\n    },\r\n    \"location\": {\r\n        \"governorate\": \"\(governorate)\",\r\n        \"region\": \"\(region)\",\r\n        \"latitude\": \(lat),\r\n        \"longitude\": \(lng)\r\n    },\r\n    \"bloodType\": \"\(bloodType)\",\r\n    \"gender\": \"\(gender)\",\r\n    \"birthDate\": {\r\n        \"year\": \(birthYear),\r\n        \"month\": \(birthMonth),\r\n        \"day\": \(birthDay)\r\n    }\r\n}"
        print(parameters)
        
        Network.loadJSONFile(fromURL: Constants.endPoint, path: Constants.editAccountInfoPath, parameters: parameters, token: accessToken, method: .PATCH, type: UserDataResponse.self, simulateLoadDelay: simulatedDelay != nil, delaySeconds: simulatedDelay ?? 0) { (result) in
            completionHandler(result)
        }
    }
    
    static func changePassword(accessToken: String, oldPassword: String, newPassword: String, simulatedDelay: Double?, completionHandler: @escaping (Result<UserDataResponse, NetworkError>) -> ()){
        let parameters = "{\r\n    \"oldPassword\": \"\(oldPassword)\",\r\n    \"newPassword\": \"\(newPassword)\"\r\n}"
        print(parameters)
        
        Network.loadJSONFile(fromURL: Constants.endPoint, path: Constants.editAccountInfoPath, parameters: parameters, token: accessToken, method: .PATCH, type: UserDataResponse.self, simulateLoadDelay: simulatedDelay != nil, delaySeconds: simulatedDelay ?? 0) { (result) in
            completionHandler(result)
        }
    }
}
