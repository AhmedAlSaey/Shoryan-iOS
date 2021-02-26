//
//  LogInSMSPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 29/12/2020.
//

class LogInSMSPresenter: BasePresenter {
    
    var phoneNumber: String?
    
    override func viewDidLoad() {
        if let view = view as? LogInSMSViewController {
            view.phoneTextField.text = phoneNumber
        }
    }
    
    
    func didClickContinueFromSMSLogIn(withCode code: String){
        guard let phoneNumber = phoneNumber else {fatalError()}
        if let view = view as? LogInSMSViewController {
            if areEntriesValid() {
                LaunchInteractor.shared.logInWithCode(phoneNumber: phoneNumber, code: code, successHandler: {
                    LaunchRouter.shared.launchStartScreen()
                }, failHandler: {
                    view.showAlert(title: "Error", message: "الرجاء التأكد من ادخال رمز صحيح")
                })
            } else {
                view.showAlert(title: "Error", message: "الرجاء التأكد من ادخال رمز صحيح")
            }
            
        }
        
    }
    
    func areEntriesValid() -> Bool {
        if let view = view as? LogInSMSViewController {
            return view.areEntriesValid()
        }
        return false
    }
    
    func backButtonPressed() {
        LaunchRouter.shared.dismissLogInSMS()
    }
    
}
