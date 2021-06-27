//
//  HomeInteractor.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//


import Foundation

class HomeInteractor: BaseInteractor{
    
    static let shared = HomeInteractor()
    
    let bloodTypeDonorDoneeCompatibility = [
        "O-" : ["O-", "O+", "A-", "A+", "B-", "B+", "AB-", "AB+"],
        "O+" : ["O+", "A+", "B+", "AB+"],
        "B-" : ["B-", "B+", "AB-", "AB+"],
        "B+" : ["B+", "AB+"],
        "A-" : ["A-", "A+", "AB-", "AB+"],
        "A+" : ["A+", "AB+"],
        "AB-" : ["AB-", "AB+"],
        "AB+" : ["AB+"]
    ]
    
    func loadHomeData(){
        
    }
    
    func getUserData(completionHandler: @escaping (Result<GetUserDataResponse, NetworkError>) -> ()){
        HomeModuleAPIManager.getUserData(accessToken: AppUser.shared.accessToken!) { result in
            if case .success(let userDataResponse) = result {
                AppUser.shared.userID = userDataResponse.user._id
                AppUser.shared.bloodType = userDataResponse.user.bloodType
                AppUser.shared.points = userDataResponse.user.points
            }
            completionHandler(result)
        }
        
    }
    
    func getOngoingRequestsList(completionHandler: @escaping (Result<[SimpleRequest], NetworkError>) -> ()){
        HomeModuleAPIManager.listAllRequests(accessToken: AppUser.shared.accessToken!) { (result) in
            completionHandler(result.map { (successResponse) -> [SimpleRequest] in
                let simpleRequests = successResponse.requests.map { (donationRequest) -> SimpleRequest in
                    let simpleRequest: SimpleRequest = SimpleRequest(
                        name: donationRequest.requestBy?.name ?? "",
                        bloodType: donationRequest.bloodType,
                        location: donationRequest.donationLocation.name + " - " + donationRequest.donationLocation.location.region,
                        _id: donationRequest._id,
                        urgent: donationRequest.urgent,
                        requester: donationRequest.requestByModelReference == "RegisteredBloodBank" ? .BloodBank : .User
                    )
                    return simpleRequest
                }
                return simpleRequests
            })
        }
    }
    
    func getPendingRequest(completionHandler: @escaping (Result<String?, NetworkError>) -> ()){
        HomeModuleAPIManager.getPendingRequest(accessToken: AppUser.shared.accessToken!) { (result) in
            completionHandler(result.map { (pendingRequestResponse) -> String? in
                return pendingRequestResponse.pendingRequest
            })
        }
    }
    
    func getSpecificRequest(requestID: String, completionHandler: @escaping (Result<DetailedRequest, NetworkError>) -> ()){
        SharedModuleAPIManager.getSpecificRequest(accessToken: AppUser.shared.accessToken!, requestID: requestID) { (result) in
            switch result {
            case .success(let request):
                let address = request.request.donationLocation.name + " : " + "\(request.request.donationLocation.location.buildingNumber)".localizeDigits + " " +  request.request.donationLocation.location.streetName + " - " + request.request.donationLocation.location.region + " - " + request.request.donationLocation.location.governorate
                let detailedRequest: DetailedRequest = DetailedRequest(
                    lng: request.request.donationLocation.location.longitude,
                    lat: request.request.donationLocation.location.latitude,
                    fullName: request.request.requestBy.name,
                    address: address,
                    bloodBags: request.request.numberOfBagsRequired - request.request.numberOfBagsFulfilled,
                    donatorsCount: request.request.numberOfComingDonors,
                    bloodType: request.request.bloodType,
                    isUserRequest: request.request.requestBy._id == AppUser.shared.userID,
                    //TODO: - Delete this if not needed in the future
//                    canUserDonate: request.error == nil,
//                    canUserDonateReasoning: self.getDonationPreventionReasoning(errorName: request.error?.message),
                    isUserADonator: request.request._id == AppUser.shared.pendingRequestID,
                    _id: request.request._id)
                completionHandler(.success(detailedRequest))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func getAllRewards(completionHandler: @escaping (Result<[SimpleReward], NetworkError>) -> ()){
        HomeModuleAPIManager.getRewards(accessToken: AppUser.shared.accessToken!) { result in
            completionHandler(result.map { response in
                response.rewards.map { reward in
                    SimpleReward(imageURL: reward.store.logo, pointCost: reward.requiredPoints, id: reward._id)
                }
            })
        }
    }
    
    func getDetailedReward(rewardID: String, completionHandler: @escaping (Result<DetailedRewardResponse, NetworkError>) -> ()){
        HomeModuleAPIManager.getDetailedReward(accessToken: AppUser.shared.accessToken!, rewardID: rewardID) { response in
            completionHandler(response)
        }
    }
    
    func redeemReward(rewardID: String, branchID: String, completionHandler: @escaping (Result<RedeemRewardResponse, NetworkError>) -> ()){
        HomeModuleAPIManager.redeemReward(accessToken: AppUser.shared.accessToken!, rewardID: rewardID, branchID: branchID) { response in
            completionHandler(response)
        }
    }
    
    func redeemRewardCodeVerification(rewardID: String, branchID: String, code: String, completionHandler: @escaping (Result<RedeemRewardCodeVerificationResponse, NetworkError>) -> ()){
        HomeModuleAPIManager.redeemRewardCodeVerification(accessToken: AppUser.shared.accessToken!, rewardID: rewardID, branchID: branchID, verificationCode: code) { response in
            if case .success(let result) = response {
                AppUser.shared.points = result.user.points
            }
            completionHandler(response)
        }
    }
    
    func getMyRequestsList(completionHandler: @escaping (Result<[SimpleRequest], NetworkError>) -> ()){
        HomeModuleAPIManager.getMyRequests(accessToken: AppUser.shared.accessToken!) { (result) in
            completionHandler(result.map { (successResponse) -> [SimpleRequest] in
                let simpleRequests = successResponse.activeRequests.map { (donationRequest) -> SimpleRequest in
                    let simpleRequest: SimpleRequest = SimpleRequest(
                        name: donationRequest.requestBy.name,
                        bloodType: donationRequest.bloodType,
                        location: donationRequest.donationLocation.name + " - " + donationRequest.donationLocation.location.region,
                        _id: donationRequest._id,
                        urgent: false,
                        requester: .User
                    )
                    return simpleRequest
                }
                return simpleRequests
            })
        }
    }
    
    
    //TODO: - Move this to shared interactor
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
    
    func isBloodTypeCompatibleWithUser(bloodType: String) -> Bool{
        guard let userBloodType = AppUser.shared.bloodType, let comaptibleArray = bloodTypeDonorDoneeCompatibility[userBloodType] else {fatalError()}
        return comaptibleArray.contains(bloodType)
    }
    
    func areBloodTypesCompatible(donor: String, donee: String) -> Bool{
        guard let comaptibleArray = bloodTypeDonorDoneeCompatibility[donor] else {fatalError()}
        return comaptibleArray.contains(donee)
    }
    
    
    
    

}
