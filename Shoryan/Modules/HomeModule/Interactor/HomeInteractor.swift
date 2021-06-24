//
//  HomeInteractor.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//


import Foundation

class HomeInteractor: BaseInteractor{
    
    static let shared = HomeInteractor()
    
    func loadHomeData(){
        
    }
    
    func getUserID(completionHandler: @escaping (Result<GetUserIDResponse, NetworkError>) -> ()){
        HomeModuleAPIManager.getUserID(accessToken: AppUser.shared.accessToken!) { result in
            if case .success(let userIDResponse) = result {
                AppUser.shared.userID = userIDResponse.user._id
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
    
    func getSpecificRequest(requestID: String, userID: String, completionHandler: @escaping (Result<DetailedRequest, NetworkError>) -> ()){
        SharedModuleAPIManager.getSpecificRequest(requestID: requestID, userID: userID) { (result) in
            switch result {
            case .success(let request):
                let address = request.request.donationLocation.name + " : " + "\(request.request.donationLocation.location.buildingNumber)".enToArDigits + " " +  request.request.donationLocation.location.streetName + " - " + request.request.donationLocation.location.region + " - " + request.request.donationLocation.location.governorate
                let detailedRequest: DetailedRequest = DetailedRequest(
                    lng: request.request.donationLocation.location.longitude,
                    lat: request.request.donationLocation.location.latitude,
                    fullName: request.request.requestBy.name.firstName + " " + request.request.requestBy.name.lastName,
                    address: address,
                    bloodBags: request.request.numberOfBagsRequired - request.request.numberOfBagsFulfilled,
                    donatorsCount: request.request.numberOfComingDonors,
                    bloodType: request.request.bloodType,
                    isUserRequest: request.request.requestBy._id == AppUser.shared.userID,
                    canUserDonate: request.userCanDonate.state,
                    canUserDonateReasoning: request.userCanDonate.message,
                    isUserADonator: request.request.comingDonors.contains(AppUser.shared.userID!),
                    _id: request.request._id)
                completionHandler(.success(detailedRequest))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    
    

}
