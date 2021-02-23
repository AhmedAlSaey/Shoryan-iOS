//
//  SignUpPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 30/12/2020.
//

import Foundation

class SignUpPresenter: BasePresenter {
    
    override func viewDidLoad() {
        guard let view = view as? SignUpViewController else {fatalError()}
        
        view.bloodTypes = LaunchInteractor.shared.getBloodTypes()
        
        
    }
    func continueClicked(fullName: String, phoneNumber: String, birthDate: String, bloodType: String, address: String, password: String, passwordConfirmation: String){
        LaunchInteractor.shared.signUp(
            fullName: fullName,
            phoneNumber: phoneNumber,
            birthDate: birthDate,
            bloodType: bloodType,
            address: address,
            password: password,
            passwordConfirmation: passwordConfirmation,
            successHandler: {
            LaunchRouter.shared.launchStartScreen()
        }, failHandler: {
            
        })
        
    }
    
}
