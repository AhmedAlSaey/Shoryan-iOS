//
//  LogInPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//

import Foundation
import JGProgressHUD

class LogInPresenter: BasePresenter, SMSAuthenticatorDelegate {
    
    var phoneNumber: String!
    
    override func viewDidLoad() {
        if let view = view as? LogInViewController {
            view.phoneTextField.validate = LaunchInteractor.shared.getPhoneNumberValidationFunction()
        }
        
    }
    func logInWithSMSClicked(phoneNumber: String){
        if validateEntries() {
            self.phoneNumber = phoneNumber
            if let view = view as? LogInViewController{
                view.showLoading()
                LaunchInteractor.shared.logInRequestCode(phoneNumber: phoneNumber) { (result) in
                    view.dismissLoading()
                    switch result {
                    case.success(_):
                        LaunchRouter.shared.pushSMSAuthenticationScreen(phoneNumber: phoneNumber, delegate: self)
                        LaunchRouter.shared.pushSMSAuthenticationScreen(phoneNumber: phoneNumber, delegate: self)
                    case.failure(let error):
                        view.showAlert(error: error)
                    }
                    
                }
                
                
            }
            
        }
    }
    func logInWithPasswordClicked(phoneNumber: String){
        if validateEntries() {
            LaunchRouter.shared.pushLogInWithPasswordPage(phoneNumber: phoneNumber)
        }
    }
    
    func validateEntries() -> Bool {
        if let view = view as? LogInViewController {
            if view.areEntriesValid() {
                return true
            } else {
                view.showAlert(title: "خطأ", message: "الرجاء التأكد من صحة رقم الهاتف")
            }
        }
        return false
    }
    
    func backButtonClicked() {
        LaunchRouter.shared.dismissLogin()
    }
    
    func didSelectValidCode(sender: SMSAuthenticationPresenter, code: String) {
        if let phoneNumber = phoneNumber, let view = view as? LogInViewController {
            LaunchInteractor.shared.logInUsingCode(phoneNumber: phoneNumber, code: code) { (result) in
                self.dismissLoading()
                switch result {
                case.success(_):
                    LaunchRouter.shared.launchStartScreen()
                case.failure(let error):
                    view.showAlert(error: error)
                }
            }
        }
        
    }
    
    func didPressBackButton(sender: SMSAuthenticationController) {
        LaunchRouter.shared.dismissSMSAuthentication()
    }
    
    func didPressResendButton(sender: SMSAuthenticationController, completionHandler: @escaping (Result<Bool, BaseError>) -> ()) {
        if let view = view as? LogInViewController{
            LaunchInteractor.shared.logInRequestCode(phoneNumber: phoneNumber) { (result) in
                view.dismissLoading()
                switch result {
                case.success(_):
                    completionHandler(.success(true))
                case.failure(let error):
                    completionHandler(.failure(error))
                }
                
            }
            
            
        }
    }
    
}

