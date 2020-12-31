//
//  LogInPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//

import Foundation

class LogInPresenter: BasePresenter {
    
    override func viewDidLoad() {
        
    }
    func logInWithSMSClicked(phoneNumber: String){
        LaunchRouter.shared.pushLogInWithSMSPage(phoneNumber: phoneNumber)
    }
    func logInWithPasswordClicked(phoneNumber: String){
        LaunchRouter.shared.pushLogInWithPasswordPage(phoneNumber: phoneNumber)
    }
    
}

