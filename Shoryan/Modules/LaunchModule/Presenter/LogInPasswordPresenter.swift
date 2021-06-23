//
//  LogInPasswordPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 29/12/2020.
//
import Foundation

class LogInPasswordPresenter: BasePresenter {
    
    var phoneNumber: String?
    
    override func viewDidLoad() {
        if let view = view as? LogInPasswordViewController {
            view.password.validate = LaunchInteractor.shared.getPasswordValidationFunction()
            view.phoneTextField.text = phoneNumber
        }
        
        
    }
    
    func didClickContinueFromPasswordLogIn(withPassword password: String){
        guard let phoneNumber = phoneNumber, let view = view as? LogInPasswordViewController else {fatalError()}
        if areEntriesValid() {
            showLoading()
            LaunchInteractor.shared.logInWithPassword(phoneNumber: phoneNumber, password: password) { (result) in
                DispatchQueue.main.async {
                    self.dismissLoading()
                    switch result {
                    case .success(let responce):
                        LaunchRouter.shared.launchStartScreen()
                    case .failure(let error):
                        view.showAlert(error: error)
                    }
                }
            }
            
        } else {
            view.showAlert(title: "Error".localized(), message: "incorrectpassword.alert".localized())
        }
        
    }
    
    func areEntriesValid() -> Bool {
        guard let view = view as? LogInPasswordViewController else {fatalError()}
        return view.areEntriesValid()
    }
    
    func backButtonPressed() {
        LaunchRouter.shared.dismissLogInPassword()
    }
    
    
    
    
}
