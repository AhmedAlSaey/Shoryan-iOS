//
//  LogInPasswordPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 29/12/2020.
//

class LogInPasswordPresenter: BasePresenter {
    
    var phoneNumber: String?
    
    override func viewDidLoad() {
        
    }
    
    func didClickContinueFromPasswordLogIn(withPassword password: String){
        guard let phoneNumber = phoneNumber else {fatalError()}
        LaunchInteractor.shared.logInWithPassword(phoneNumber: phoneNumber, password: password, successHandler: {
            LaunchRouter.shared.launchStartScreen()
        }, failHandler: {
            
        })
    }
    
    
    
    
}
