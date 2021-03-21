//
//  AuthorizationNetworking.swift
//  BI Premier League
//
//  Created by Ahmed AlSai on 12/03/2021.
//

import Foundation

class LaunchModuleAPIManager {
    static func authenticateUserPassword(phoneNumber: String, password: String, simulatedDelay: Double?, completionHandler: @escaping (Result<LoginPasswordResponse, NetworkError>) -> ()){
        
        let parameters = "{\r\n    \"phoneNumber\": \(phoneNumber),\r\n    \"password\": \"\(password)\"\r\n}"
        
        Network.loadJSONFile(fromURL: Constants.endPoint, path: Constants.loginPath, parameters: parameters, method: .POST, type: LoginPasswordResponse.self, simulateLoadDelay: simulatedDelay != nil, delaySeconds: simulatedDelay ?? 0) { (result) in
            completionHandler(result)
        }
        
    }
    
    static func registerUser(firstName: String, lastName: String, phoneNumber: Int, password: String, governorate: String, region: String, lat: Double, lng: Double, bloodType: String, gender: String, birthYear: Int, birthMonth: Int, birthDay: Int, simulatedDelay: Double?, completionHandler: @escaping (Result<RegisterResponse, NetworkError>) -> ()){
        
        let parameters = "{\r\n    \"name\":{\r\n        \"firstName\": \"\(firstName)\",\r\n        \"lastName\": \"\(lastName)\"\r\n    },\r\n    \"phoneNumber\": \(phoneNumber),\r\n    \"password\": \"\(password)\",\r\n    \"location\": {\r\n        \"governorate\": \"\(governorate)\",\r\n        \"region\": \"\(region)\",\r\n        \"latitude\": \(lat),\r\n        \"longitude\": \(lng)\r\n    },\r\n    \"bloodType\": \"\(bloodType) \",\r\n    \"gender\": \"\(gender)\",\r\n    \"birthDate\": {\r\n        \"year\": \(birthYear),\r\n        \"month\": \(birthMonth),\r\n        \"day\": \(birthDay)\r\n    }\r\n}"
        
        Network.loadJSONFile(fromURL: Constants.endPoint, path: Constants.signupPath, parameters: parameters, method: .POST, type: RegisterResponse.self, simulateLoadDelay: simulatedDelay != nil, delaySeconds: simulatedDelay ?? 0) { (result) in
            completionHandler(result)
        }
        
    }
//
//    static func sendCodeForForgotPasswordScreen(email: String, simulatedDelay: Double?, completionHandler: @escaping (Result<ChangePasswordEmailResponse, NetworkError>) -> ()) {
//        let parameters = "{\n\t\"email\": \"\(email)\"\n}"
//        Network.loadJSONFile(fromURL: Constants.endPoint, path: Constants.changePasswordEmailPath, parameters: parameters, method: .POST, type: ChangePasswordEmailResponse.self, simulateLoadDelay: simulatedDelay != nil, delaySeconds: simulatedDelay ?? 0) { (result) in
//            completionHandler(result)
//        }
//    }
//
//    static func requestChangePasswordAccessToken(email: String, code: String, simulatedDelay: Double?, completionHandler: @escaping (Result<ChangePasswordEmailAndCodeResponse, NetworkError>) -> ()) {
//        let parameters = "{\n\t\"email\": \"\(email)\",\n\t\"code\": \"\(code)\"\n}"
//        Network.loadJSONFile(fromURL: Constants.endPoint, path: Constants.changePasswordEmailAndCodePath, parameters: parameters, method: .POST, type: ChangePasswordEmailAndCodeResponse.self, simulateLoadDelay: simulatedDelay != nil, delaySeconds: simulatedDelay ?? 0) { (result) in
//            completionHandler(result)
//        }
//    }
//
//    static func changePassword(email: String, password: String, token: String, simulatedDelay: Double? = nil, completionHandler: @escaping (Result<ChangePasswordNewPasswordResponse, NetworkError>) -> ()) {
//        let parameters = "{\n\t\"email\": \"\(email)\",\n\t\"password\": \"\(password)\"\n}"
//
//        Network.loadJSONFile(fromURL: Constants.endPoint, path: Constants.changePasswordNewPasswordPath, parameters: parameters, token: token, method: .POST, type: ChangePasswordNewPasswordResponse.self, simulateLoadDelay: simulatedDelay != nil, delaySeconds: simulatedDelay ?? 0) { (results) in
//            completionHandler(results)
//        }
//    }
}
