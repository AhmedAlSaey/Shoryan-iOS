//
//  RequestInteractor.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 22/03/2021.
//

import Foundation

class SharedInteractor: BaseInteractor {
    static let shared = SharedInteractor()
    
    func registerUserAsDonor (forRequest requestID: String, completionHandler: @escaping (Result<RequestUpdate, NetworkError>) -> ()) {
        SharedModuleAPIManager.registerUserAsDonor(requestID: requestID, accessToken: AppUser.shared.accessToken!) { (result) in
            completionHandler(result.map { (response) -> RequestUpdate in
                RequestUpdate(donatorsCount: response.request.numberOfComingDonors, bloodBagsCount: response.request.numberOfBagsRequired - response.request.numberOfBagsFulfilled, bloodType: response.request.bloodType, canUserDonate: response.error == nil, donationPreventionReason: self.getDonationPreventionReasoning(errorName: response.error?.message))
            })
        }
    }
    
    func removeUserAsDonor (forRequest requestID: String, completionHandler: @escaping (Result<RequestUpdate, NetworkError>) -> ()) {
        SharedModuleAPIManager.removeUserAsDonor(requestID: requestID, accessToken: AppUser.shared.accessToken!) { (result) in
            completionHandler(result.map { (response) -> RequestUpdate in
                RequestUpdate(donatorsCount: response.request.numberOfComingDonors, bloodBagsCount: response.request.numberOfBagsRequired - response.request.numberOfBagsFulfilled, bloodType: response.request.bloodType, canUserDonate: response.error == nil, donationPreventionReason: self.getDonationPreventionReasoning(errorName: response.error?.message))
            })
        }
    }
    
    func confirmUserAsDonor (forRequest requestID: String, completionHandler: @escaping (Result<RequestUpdate, NetworkError>) -> ()) {
        SharedModuleAPIManager.confirmUserAsDonor(requestID: requestID, accessToken: AppUser.shared.accessToken!) { (result) in
            completionHandler(result.map { (response) -> RequestUpdate in
                RequestUpdate(donatorsCount: response.request.numberOfComingDonors, bloodBagsCount: response.request.numberOfBagsRequired - response.request.numberOfBagsFulfilled, bloodType: response.request.bloodType, canUserDonate: response.error == nil, donationPreventionReason: self.getDonationPreventionReasoning(errorName: response.error?.message))
            })
        }
    }
    
    
    func getDonationPreventionReasoning(errorName: String?) -> String? {
        guard let errorName = errorName else {return nil}
        switch errorName {
        case "INCOMPATIBLE_BLOOD_TYPE":
            return "incompatiblebloodtype.alert".localized()
        case "AGE_CHECK_FAILS":
            return "agecheckfail.alert".localized()
        case "BREAK_TIME_CHECK_FAILS":
            return "breaktimecheckfail.alert".localized()
        case "USER_GOING_TO_ANOTHER_REQUEST":
            return "usergoingtoanotherrequest.alert".localized()
        case "ALREADY_GOING_TO_THIS_REQUEST":
            return "alreadygoingtorequest.alert".localized()
        default:
            return "cantdonatetorequest.alert".localized()
        }
    }
}

