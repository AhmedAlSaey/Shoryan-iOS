//
//  LaunchModuleAPIManager.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import Foundation

class LaunchModuleAPIManager{
    static func signUp(fullName: String, phoneNumber: String, birthDate: String, bloodType: String, address: String, password: String, passwordConfirmation: String) {
        var semaphore = DispatchSemaphore (value: 0)

        let parameters = "\r\n    {\r\n        \"name\": {\r\n            \"firstName\": \"\(fullName)\",\r\n            \"lastName\": \"\(fullName)\"\r\n        },\r\n        \"phoneNumber\": \(phoneNumber),\r\n        \"password\": \"\(password)\",\r\n        \"location\": {\r\n            \"region\": \"\(address)\",\r\n            \"latitude\": 110,\r\n            \"longitude\": 334\r\n        },\r\n        \"bloodType\": \"\(bloodType)\",\r\n        \"gender\": \"Male\",\r\n        \"birthDate\": {\r\n            \"year\": 1998,\r\n            \"month\": 6,\r\n            \"day\": 7\r\n        },\r\n        \"__v\": 0\r\n    }\r\n"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "localhost:3000/users")!,timeoutInterval: Double.infinity)
        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
}
