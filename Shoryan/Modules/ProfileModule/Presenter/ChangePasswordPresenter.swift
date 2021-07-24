//
//  ChangePasswordPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 22/07/2021.
//

import Foundation

class ChangePasswordPresenter: BasePresenter {
    
    override func viewDidLoad() {
        guard let view = view as? ChangePasswordViewController else {fatalError()}
        view.oldPasswordTextField.validate = ProfileInteractor.shared.getPasswordValidationFunction()
        view.newPasswordTextField.validate = ProfileInteractor.shared.getPasswordValidationFunction()
        view.passwordConfirmationTextField.validate = ProfileInteractor.shared.getPasswordValidationFunction()
        view.passwordConfirmationTextField.mainPasswordTextField = view.newPasswordTextField
    }
    
    func saveClicked(oldPassword: String, newPassword: String, passwordConfirmation: String){
        
        if let view = view as? ChangePasswordViewController {
            if view.isAllInputValid() {
                
                showLoading()
                ProfileInteractor.shared.changePassword(oldPassword: oldPassword, newPassword: newPassword, passwordConfirmation: passwordConfirmation, completionHandler: { result in
                    self.dismissLoading()
                    switch result {
                    case.success(_):
                        view.showAlert(title: "Success".localized(), message: "passwordchanged.alert".localized()) {
                            ProfileRouter.shared.dissmissChangePassword()
                        }
                        break;
                    case.failure(let error):
                        view.showAlert(error: error)
                    }
                })
            }
            else {
                view.showAlert(message: "incorrectinput.alert".localized())
            }
        }
    }
    
    func backButtonPressed() {
        ProfileRouter.shared.dissmissChangePassword()
    }
}
