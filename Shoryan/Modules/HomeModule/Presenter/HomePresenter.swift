//
//  HomePresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import Foundation
import JGProgressHUD

class HomePresenter: BasePresenter, FilterDelegate {
    
    var unfilteredRequests: [SimpleRequest]?
    var filterParams: [String:String]?
    override func viewDidLoad() {
        showLoading()
        getUserData {
            self.getOngoingRequests()
            self.getPendingRequest()
        }
        
    }
    
    func getUserData(completionHandler: @escaping () -> ()) {
        HomeInteractor.shared.getUserData { result in
            if case .failure(let error) = result {
                if let view = self.view as? HomeViewController {
                    //TODO: - Make this more generalized
                    if error is JWTExpiredError {
                        view.showAlert(error: error) {
                            let window: UIWindow?
                            AppUser.shared.clearUserData()
                            LaunchRouter.shared.launchAuthorizationPage()
                        }
                    }
                    else {
                        view.showAlert(error: error) {
                            self.getUserData(completionHandler: completionHandler)
                        }
                    }
                }
            } else {
                completionHandler()
            }
        }
    }
    
    func getOngoingRequests(){
        HomeInteractor.shared.getOngoingRequestsList { (result) in
            self.dismissLoading()
            DispatchQueue.main.async {
                switch result {
                case .success(let simpleRequests):
                    (self.view as! HomeViewController).requests = simpleRequests
                    self.unfilteredRequests = simpleRequests
                case .failure(let error):
                    (self.view as! HomeViewController).showAlert(error: error)
                }
            }
        }
    }
    
    func getPendingRequest() {
        AppUser.shared.pendingRequestID = nil
        HomeInteractor.shared.getPendingRequest { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let pendingRequest):
                    AppUser.shared.pendingRequestID = pendingRequest
                case .failure(let error):
                    (self.view as! HomeViewController).showAlert(error: error, okAction: {
                        self.getPendingRequest()
                    })
                }
            }
        }
    }
    
    func requestSelected (atRow row: Int) {
        guard let view = view as? HomeViewController else {fatalError()}
        showLoading()
        getDetailedRequest(fromRequestID: view.requests![row]._id, userID: AppUser.shared.userID!, completionHandler: { (result) in
            self.dismissLoading()
            DispatchQueue.main.async {
                switch result {
                case .success(let detailedRequest):
                    HomeRouter.shared.presentRequest(detailedRequest: detailedRequest)
                    break
                case .failure(let error):
                    view.showAlert(error: error)
                }
            }
        })
    }
    
    func getDetailedRequest(fromRequestID requestID: String, userID: String, completionHandler: @escaping (Result<DetailedRequest, NetworkError>) -> ()){
        HomeInteractor.shared.getSpecificRequest(requestID: requestID) { (result) in
            completionHandler(result)
            
        }
    }
    
    func pendingRequestCardClicked() {
        guard let view = view as? HomeViewController else {fatalError()}
        showLoading()
        if let pendingRequestID = AppUser.shared.pendingRequestID {
            getDetailedRequest(fromRequestID: pendingRequestID, userID: AppUser.shared.userID!) { (result) in
                self.dismissLoading()
                switch result {
                case .success(let detailedRequest):
                    HomeRouter.shared.presentRequest(detailedRequest: detailedRequest)
                    break
                case .failure(let error):
                    view.showAlert(error: error)
                }
            }
        }
        else{
            self.dismissLoading()
            view.showAlert(title: "Error".localized(), message: "notregistereddonor.alert".localized())
        }
    }
    
    func rewardsCardClicked() {
        HomeRouter.shared.pushRewards()
    }
    
    func myRequestsCardClicked() {
        HomeRouter.shared.pushMyRequests()
    }
    
    func filterViewPressed(){
        HomeRouter.shared.presentFilter(delegate: self, params: filterParams)
    }
    
    func viewWillDisappear(withParameters params: [String : String]) {
        filterParams = params
        guard let selectedBloodType = params["bloodType"] else {
            (self.view as! HomeViewController).requests = unfilteredRequests
            return
        }
        if selectedBloodType == "allowed" {
            (self.view as! HomeViewController).requests = unfilteredRequests?.filter({ request in
                HomeInteractor.shared.isBloodTypeCompatibleWithUser(bloodType: request.bloodType)
            })
        }        else {
            (self.view as! HomeViewController).requests = unfilteredRequests?.filter({ request in
                 request.bloodType == selectedBloodType
            })
        }
        
    }

}

