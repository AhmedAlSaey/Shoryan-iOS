//
//  HomePresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import Foundation
import JGProgressHUD

class HomePresenter: BasePresenter {
    
    
    override func viewDidLoad() {
        showLoading()
        getUserID {
            self.getOngoingRequests()
            self.getPendingRequest()
        }
        
    }
    
    func getUserID(completionHandler: @escaping () -> ()) {
        HomeInteractor.shared.getUserID { result in
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
                            self.getUserID(completionHandler: completionHandler)
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
        HomeInteractor.shared.getSpecificRequest(requestID: requestID, userID: userID) { (result) in
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
}

