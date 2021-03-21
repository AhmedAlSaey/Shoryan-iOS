//
//  Network.swift
//  BI Premier League
//
//  Created by Ahmed AlSai on 11/03/2021.
//

import Foundation

enum URLRequestType {
    case POST
    case GET
    
    var stringValue : String {
        switch self {
        case .POST:
            return "POST"
        case .GET:
            return "GET"
        }
    }
}

class Network {
    static func loadJSONFile<T: Decodable>(fromURL urlString: String,
                                           path: String? = nil,
                                           parameters: String? = nil,
                                           token: String? = nil,
                                           method: URLRequestType,
                                           type: T.Type,
                                           queue: DispatchQueue? = DispatchQueue.main,
                                           simulateLoadDelay: Bool? = true,
                                           delaySeconds: TimeInterval = 0.2,
                                           completionHandler: @escaping (Result<T,NetworkError>) -> Void) {
        var urlComponents = URLComponents(string: urlString)
        
        if let path = path {
            urlComponents?.path = path
        }
        
        guard let url = urlComponents?.url else {
            if let dispatchQueue = queue {
                dispatchQueue.asyncAfter(deadline: DispatchTime.now() + delaySeconds) {
                    completionHandler(.failure(InvalidPathError()))
                }
            } else {
                completionHandler(.failure(InvalidPathError()))
            }
            return
        }
        print("URL: \(url)")
        
        
        
        
        var request = URLRequest(url: url, timeoutInterval: 15)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        if let token = token {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        request.httpMethod = method.stringValue
        
        if let parameters = parameters {
            let postData = parameters.data(using: .utf8)
            request.httpBody = postData
        }
        
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 200
            
            if !(200...299).contains(statusCode) {
                if let dispatchQueue = queue {
                    dispatchQueue.asyncAfter(deadline: DispatchTime.now() + delaySeconds) {
                        completionHandler(.failure(RequestError()))
                    }
                } else {
                    completionHandler(.failure(RequestError()))
                }
                return
            }
            if let jsonData = data {
                let decoder = JSONDecoder()
                do {
                    self.convertJSONToString(json: jsonData)
                    let typedObject: T = try decoder.decode(T.self, from: jsonData)
                    if let dispatchQueue = queue {
                        dispatchQueue.asyncAfter(deadline: DispatchTime.now() + delaySeconds) {
                            completionHandler(.success(typedObject))
                        }
                    } else {
                        completionHandler(.success(typedObject))
                    }
                    
                }
                catch DecodingError.dataCorrupted(let context) {
                   print(context)
               } catch DecodingError.keyNotFound(let key, let context) {
                   print("Key '\(key)' not found:", context.debugDescription)
                   print("codingPath:", context.codingPath)
               } catch DecodingError.valueNotFound(let value, let context) {
                   print("Value '\(value)' not found:", context.debugDescription)
                   print("codingPath:", context.codingPath)
               } catch DecodingError.typeMismatch(let type, let context)  {
                   print("Type '\(type)' mismatch:", context.debugDescription)
                   print("codingPath:", context.codingPath)
               } catch {
                   print("error: ", error)
               }
//                catch {
//                    print(error)
//                    do {
//                        let errorObject: DecodableErrorResponse = try decoder.decode(DecodableErrorResponse.self, from: jsonData)
//                        completionHandler(.failure(NetworkError.getNetwrokError(fromResponseError: errorObject)))
//                    }
//                    catch {
//                        //TODO: - Fix this line to return appropriate error
//                        completionHandler(.failure(ParseError()))
//                    }
//                }
            }
            else {
                if let error = error {
                    guard let error = error as? NSError else {fatalError("Unexpected error type")}
                    completionHandler(.failure(NetworkError.getNetwrokError(fromError: error)))
                }
                else{
                    fatalError("No data or error recieved")
                }
                
            }
        }
        dataTask.resume()
    }
    static func convertJSONToString(json: Data){
            do {
                let convertedString = String(data: json, encoding: String.Encoding.utf8) // the data will be converted to the string
                print(convertedString) // <-- here is ur string

            } catch let myJSONError {
                print(myJSONError)
            }

    }
}
