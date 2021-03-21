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
        guard let phoneNumber = phoneNumber, let view = view as? LogInPasswordViewController else {fatalError()}
        if areEntriesValid() {
            view.showLoading()
            LaunchInteractor.shared.logInWithPassword(phoneNumber: phoneNumber, password: password) { (result) in
                self.view?.dismissLoading()
                switch result {
                case .success(_):
                    LaunchRouter.shared.launchStartScreen()
                case .failure(let error):
                    view.showAlert(error: error)
                }
            }
            
        } else {
            view.showAlert(title: "Error", message: "الرجاء التأكد من صحة كلمة كلمة المرور")
        }
        
    }
    
    func areEntriesValid() -> Bool {
        guard let view = view as? LogInPasswordViewController else {fatalError()}
        return view.areEntriesValid()
    }
    
    func backButtonPressed() {
        LaunchRouter.shared.dismissLogInPassword()
    }
    
    
    
    
}
