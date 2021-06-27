//
//  MyRequestsPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/06/2021.
//

import Foundation

class MyRequestsPresenter: BasePresenter {
    
    override func viewDidLoad() {
        showLoading()
        self.getMyRequests { Result in
            self.dismissLoading()
        }
    }
    
    func getMyRequests(completionHandler: @escaping (Result<[SimpleRequest], NetworkError>) -> ()) {
        HomeInteractor.shared.getMyRequestsList { result in
            guard let view = self.view as? MyRequestsViewController else {fatalError()}
            
            switch result{
            case .success(let successResult):
                view.requests = successResult
            case .failure(let error):
                view.showAlert(error: error) {
                    HomeRouter.shared.popMyRequests()
                }
            }
            completionHandler(result)
        }
    }
    
    func requestSelected (atRow row: Int) {
        guard let view = view as? MyRequestsViewController else {fatalError()}
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
    
    func backButtonClicked() {
        HomeRouter.shared.popMyRequests()
    }
    
    func addRequestButtonLClicked() {
        HomeRouter.shared.navigateToNewRequestTab()
    }
}
