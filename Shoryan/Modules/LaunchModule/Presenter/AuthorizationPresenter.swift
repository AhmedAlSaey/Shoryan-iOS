//
//  AuthorizationPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//

import Foundation
import Localize_Swift

class AuthorizationPresenter: BasePresenter {
    override func viewDidLoad() {
        
    }
    func logInButtonClicked(){
        LaunchRouter.shared.pushLogInPage()
    }
    func signUpButtonClicked(){
        LaunchRouter.shared.pushSignUp()
    }
    
    func languageButtonClicked() {
        guard let view = view as? AuthorizationViewController else {return}
        LaunchRouter.shared.presentLanguageSelectionScreen(onTopOf: view)
    }
}
