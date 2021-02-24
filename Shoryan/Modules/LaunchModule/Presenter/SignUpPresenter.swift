//
//  SignUpPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 30/12/2020.
//

import UIKit

class SignUpPresenter: BasePresenter {
    
    override func viewDidLoad() {
        guard let view = view as? SignUpViewController else {fatalError()}
        
        view.bloodTypes = LaunchInteractor.shared.getBloodTypes()
        view.genders = LaunchInteractor.shared.getGenders()
        
        view.firstNameTextField.validate = LaunchInteractor.shared.getFirstNameValidationFunction()
        view.secondNameTextField.validate = LaunchInteractor.shared.getLastNameValidationFunction()
        
        view.phoneNumberTextField.validate = LaunchInteractor.shared.getPhoneNumberValidationFunction()
        
        view.dateTextField.validate = LaunchInteractor.shared.getBirthDateValidationFunction()
        view.bloodTypeTextField.validate = LaunchInteractor.shared.getBloodTypeValidationFunction()
        view.genderTextField.validate = LaunchInteractor.shared.getGenderValidationFunction()
        view.addressTextField.validate = LaunchInteractor.shared.getLocationValidationFunction()
        view.passwordTextField.validate = LaunchInteractor.shared.getPasswordValidationFunction()
        view.passwordConfirmationTextField.validate = LaunchInteractor.shared.getPasswordConfirmationValidationFunction()
        view.passwordConfirmationTextField.mainPasswordTextField = view.passwordTextField
        
    }
    func continueClicked(firstName: String, lastName: String, phoneNumber: String, birthDate: String, bloodType: String, password: String, passwordConfirmation: String){
        
        if let view = view as? SignUpViewController {
            if view.isAllInputValid() {
                LaunchInteractor.shared.signUp(
                    firstName: firstName,
                    lastName: lastName,
                    phoneNumber: phoneNumber,
                    birthDate: birthDate,
                    bloodType: bloodType,
                    password: password,
                    passwordConfirmation: passwordConfirmation,
                    successHandler: {
                    LaunchRouter.shared.launchStartScreen()
                }, failHandler: {
                    
                })
            }
            else {
                view.showAlert(message: "الرجاء التأكد من ادخال جميع المعلومات و التأكد من صحتها")
            }
        }
        
        
        
        
    }
    
}
