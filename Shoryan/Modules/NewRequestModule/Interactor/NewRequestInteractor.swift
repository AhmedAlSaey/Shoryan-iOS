//
//  NewRequestInteractor.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import Foundation


import Foundation

class NewRequestInteractor {
    
    static let shared = NewRequestInteractor()
    
    func canUserCreateRequest(completionHandler: @escaping (Result<BloodBanksResponse, NetworkError>) -> ()){
        NewRequestModuleAPIManager.canUserCreateRequest(accessToken: AppUser.shared.accessToken!) { result in
            completionHandler(result)
        }
    }
    
    

}
