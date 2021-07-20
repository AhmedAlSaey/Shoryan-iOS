//
//  ProfileInteractor.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import Foundation

class ProfileInteractor: BaseInteractor {
    
    static let shared = ProfileInteractor()
    
    func getUserPoints() -> String {
        "\(AppUser.shared.points ?? 0)"
    }
    
    func getUserDonation() -> String {
        "\(AppUser.shared.donations ?? 0)"
    }
    
    func getUserFistName() -> String {
        "\(AppUser.shared.firstName ?? "")"
    }
    
    func clearUserData() {
        AppUser.shared.clearUserData()
    }
    
    

}
