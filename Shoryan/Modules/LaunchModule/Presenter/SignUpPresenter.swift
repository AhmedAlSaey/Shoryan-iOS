//
//  SignUpPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 30/12/2020.
//

import Foundation

class SignUpPresenter: BasePresenter {
    
    override func viewDidLoad() {
        
    }
    func continueClicked(){
        LaunchInteractor.shared.signUp(successHandler: {
            LaunchRouter.shared.launchStartSscreen()
        }, failHandler: {
            
        })
        
    }
    
}
