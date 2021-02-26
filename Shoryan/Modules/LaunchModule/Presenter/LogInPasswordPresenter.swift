//
//  LogInPasswordPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 29/12/2020.
//

class LogInPasswordPresenter: BasePresenter {
    
    var phoneNumber: String?
    
    override func viewDidLoad() {
        if let view = view as? LogInPasswordViewController {
            view.password.validate = LaunchInteractor.shared.getPasswordValidationFunction()
            view.phoneTextField.text = phoneNumber
        }
        
    }
    
    func didClickContinueFromPasswordLogIn(withPassword password: String){
        guard let phoneNumber = phoneNumber else {fatalError()}
        if areEntriedValid() {
            LaunchInteractor.shared.logInWithPassword(phoneNumber: phoneNumber, password: password, successHandler: {
                LaunchRouter.shared.launchStartScreen()
            }, failHandler: {
                view?.showAlert(title: "Error", message: "الرجاء التأكد من صحة كلمة كلمة المرور")
            })
        } else {
            view?.showAlert(title: "Error", message: "الرجاء التأكد من صحة كلمة كلمة المرور")
        }
        
    }
    
    func areEntriedValid() -> Bool {
        guard let view = view as? LogInPasswordViewController else {fatalError()}
        return view.areEntriesValid()
    }
    
    func backButtonPressed() {
        LaunchRouter.shared.dismissLogInPassword()
    }
    
    
    
    
}
