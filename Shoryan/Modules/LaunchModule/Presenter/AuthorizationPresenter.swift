//
//  AuthorizationPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//

import Foundation

class AuthorizationPresenter: BasePresenter {
    
    override func viewDidLoad() {
        
    }
    func logInButtonClicked(){
        LaunchRouter.shared.pushLogInPage()
    }
    func signUpButtonClicked(){
        
    }
}
