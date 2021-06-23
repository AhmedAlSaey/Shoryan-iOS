//
//  SignUpPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 30/12/2020.
//

import UIKit

class SignUpPresenter: BasePresenter {
    
    var selectedLocationLng: Double?
    var selectedLocationLat: Double?
    var selectedLocationCity: String?
    var selectedLocationGovernorate: String?
    
    var firstName: String!
    var lastName: String!
    var phoneNumber: String!
    var birthDate: Date!
    var bloodType: String!
    var gender: String!
    var password: String!
    
    
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
    func continueClicked(firstName: String, lastName: String, phoneNumber: String, birthDate: Date, bloodType: String, gender: String, password: String){
        
        if let view = view as? SignUpViewController {
            if view.isAllInputValid(), let lat = selectedLocationLat, let lng = selectedLocationLng {
                
                self.firstName = firstName
                self.lastName = lastName
                self.phoneNumber = phoneNumber
                self.birthDate = birthDate
                self.bloodType = bloodType
                self.gender = gender
                self.password = password
                
                showLoading()
                LaunchInteractor.shared.signUp(
                    firstName: firstName,
                    lastName: lastName,
                    phoneNumber: phoneNumber,
                    birthDate: birthDate,
                    bloodType: bloodType,
                    gender: gender,
                    lng: lat,
                    lat: lng,
                    governorate: selectedLocationGovernorate!,
                    region: selectedLocationCity!,
                    password: password) { (result) in
                    self.dismissLoading()
                    switch result {
                    case.success(_):
                        LaunchRouter.shared.pushSMSAuthenticationScreen(phoneNumber: phoneNumber, delegate: self)
                    case.failure(let error):
                        view.showAlert(error: error)
                    }
                }
            }
            else {
                view.showAlert(message: "الرجاء التأكد من ادخال جميع المعلومات و التأكد من صحتها")
            }
        }
        
        
        
        
    }
    
    func backButtonPressed() {
        LaunchRouter.shared.dissmissSignup()
    }
    
    func locationButtonPressed() {
        LaunchRouter.shared.launchMapSelectorSignup(delegate: self)
    }
    
    
    
    
    
}

extension SignUpPresenter: MapSelectorDelegate{
    func didSelectLocation(lng: Double, lat: Double, city: String?, governorate: String?, formattedAddress: String?) {
        selectedLocationLng = lng
        selectedLocationLat = lat
        selectedLocationCity = city
        selectedLocationGovernorate = governorate
        
        if let view = view as? SignUpViewController {
            view.addressTextField.text = formattedAddress
        }
        LaunchRouter.shared.dissmissMapSelector()
    }
    
    func didPressBackButton() {
        LaunchRouter.shared.dissmissMapSelector()
    }
    
    
}

extension SignUpPresenter: SMSAuthenticatorDelegate {

    
    func didPressResendButton(sender: SMSAuthenticationController, completionHandler: @escaping (Result<Bool, BaseError>) -> ()) {
        guard let lat = selectedLocationLat, let lng = selectedLocationLng else {fatalError("The location should be selected at this stage")}
        showLoading()
        LaunchInteractor.shared.signUp(
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            birthDate: birthDate,
            bloodType: bloodType,
            gender: gender,
            lng: lat,
            lat: lng,
            governorate: selectedLocationGovernorate!,
            region: selectedLocationCity!,
            password: password) { (result) in
            self.dismissLoading()
            switch result {
            case.success(_):
                completionHandler(.success(true))
            case.failure(let error):
                completionHandler(.failure(error))
            }
        }
            
        
    }
    
    
    func didSelectValidCode(sender: SMSAuthenticationPresenter, code: String) {
        if let phoneNumber = phoneNumber, let view = view as? SignUpViewController {
            LaunchInteractor.shared.signUpVerifyCode(phoneNumber: phoneNumber, code: code) { result in
                switch result{
                case .success(_):
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
}
