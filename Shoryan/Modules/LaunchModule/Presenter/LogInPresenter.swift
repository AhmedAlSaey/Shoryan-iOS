//
//  LogInPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//

import Foundation

class LogInPresenter: BasePresenter {
    
    override func viewDidLoad() {
        if let view = view as? LogInViewController {
            view.phoneTextField.validate = LaunchInteractor.shared.getPhoneNumberValidationFunction()
        }
        
    }
    func logInWithSMSClicked(phoneNumber: String){
        if validateEntries() {
            LaunchRouter.shared.pushLogInWithSMSPage(phoneNumber: phoneNumber)
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
                view.showAlert(title: "Error", message: "الرجاء التأكد من صحة رقم الهاتف")
            }
        }
        return false
    }
    
    func backButtonClicked() {
        LaunchRouter.shared.dismissLogin()
    }
    
}

