//
//  LogInSMSPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 29/12/2020.
//

class LogInSMSPresenter: BasePresenter {
    
    var phoneNumber: String?
    
    override func viewDidLoad() {
        
    }
    
    
    func didClickContinueFromSMSLogIn(withCode code: String){
        guard let phoneNumber = phoneNumber else {fatalError()}
        LaunchInteractor.shared.logInWithCode(phoneNumber: phoneNumber, code: code, successHandler: {
            LaunchRouter.shared.launchStartScreen()
        }, failHandler: {
            
        })
    }
    
}
