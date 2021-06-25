//
//  RequestPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 22/03/2021.
//

import Foundation

class RequestPresenter: BasePresenter {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func exitButtonPressed() {
        view?.dismiss(animated: true, completion: nil)
    }
    
    func primaryButtonClicked() {
        guard let view = view as? RequestViewController else {fatalError()}
        showLoading()
        switch view.primaryButtonFunctionality {
        case .Donate:
                SharedInteractor.shared.registerUserAsDonor(forRequest: view.request!._id) { (result) in
                    DispatchQueue.main.async {
                        self.dismissLoading()
                        switch result {
                        case (.success(let update)):
                            if !update.canUserDonate {
                                view.showAlert(title: "Error".localized(), message: update.donationPreventionReason!)
                            }
                            else {
                                view.request?.bloodBags = update.bloodBagsCount
                                view.request?.donatorsCount = update.donatorsCount
                                view.request?.isUserADonator = true
                                AppUser.shared.pendingRequestID = view.request?._id
                                view.setup()
                                view.setupViewForActiveRequest()
                                view.showAlert(title: "Done".localized(), message: "donorregistered.alert".localized())
                            }
                            
                        case (.failure(let error)):
                            view.showAlert(error: error)
                        }
                    }
                }
            
        case .ConfirmDonation:
            SharedInteractor.shared.confirmUserAsDonor(forRequest: view.request!._id) { result in
                DispatchQueue.main.async {
                    self.dismissLoading()
                    switch result {
                    case (.success(let update)):
                        if !update.canUserDonate {
                            view.showAlert(title: "Error".localized(), message: update.donationPreventionReason!)
                        }
                        else{
                            view.request?.bloodBags = update.bloodBagsCount
                            view.request?.donatorsCount = update.donatorsCount
                            view.request?.isUserADonator = false
                            AppUser.shared.pendingRequestID = nil
                            view.setup()
                            view.setupViewForInactiveRequest()
                            view.showAlert(title: "Done".localized(), message: "donationsuccess.alert".localized(), okAction: {
                                SharedRouter.shared.dismissRequestView(vc: view)
                            })
                        }
                        
                        
                    case (.failure(let error)):
                        view.showAlert(error: error)
                    }
                }
            }
            
            break
        case .none:
            fatalError("Value should not be none at this stage")
        }
    }
    
    func secondaryButtonClicked() {
        guard let view = view as? RequestViewController else {fatalError()}
        showLoading()
        switch view.secondaryButtonFunctionality {
        case .CancelDonation:
            SharedInteractor.shared.removeUserAsDonor(forRequest: view.request!._id) { (result) in
                DispatchQueue.main.async {
                    self.dismissLoading()
                    switch result {
                    case (.success(let update)):
                        
                        view.request?.bloodBags = update.bloodBagsCount
                        view.request?.donatorsCount = update.donatorsCount
                        view.request?.isUserADonator = false
                        AppUser.shared.pendingRequestID = nil
                        view.setup()
                        view.setupViewForInactiveRequest()
                        view.showAlert(title: "Done".localized(), message: "canceldonationsuccess.alert".localized())
                        
                    case (.failure(let error)):
                        view.showAlert(error: error)
                    }
                }
            }
        case .CancelRequest:
            fatalError("Unimplemented feature")
            break
        case .none:
            fatalError("Value should not be none at this stage")
        }
        
        
    }
}
