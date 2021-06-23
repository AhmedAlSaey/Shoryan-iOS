//
//  LogInSMSPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 29/12/2020.
//
protocol SMSAuthenticatorDelegate {
    func didSelectValidCode(sender: SMSAuthenticationPresenter, code: String)
    func didPressBackButton(sender: SMSAuthenticationController)
    func didPressResendButton(sender: SMSAuthenticationController, completionHandler: @escaping (Result<Bool, BaseError>) -> ())
}

protocol SMSAuthenticationController {
    func displayAlert(withTitle title: String, message: String)
    
}

class SMSAuthenticationPresenter: BasePresenter, SMSAuthenticationController {
    
    
    var phoneNumber: String?
    var delegate: SMSAuthenticatorDelegate?
    
    override func viewDidLoad() {
        if let view = view as? SMSAuthenticationViewController {
            view.phoneTextField.text = phoneNumber
        }
    }
    
    
    func didClickContinue(withCode code: String){
        guard let phoneNumber = phoneNumber else {fatalError()}
        if let view = view as? SMSAuthenticationViewController {
            if areEntriesValid() {
//                LaunchInteractor.shared.logInWithCode(phoneNumber: phoneNumber, code: code, successHandler: {
//                    LaunchRouter.shared.launchStartScreen()
//                }, failHandler: {
//                    view.showAlert(title: "خطأ", message: "الرجاء التأكد من ادخال رمز صحيح")
//                })
                delegate?.didSelectValidCode(sender: self, code: code)
            } else {
                view.showAlert(title: "Error".localized(), message: "incorrectcode.alert".localized())
            }
            
        }
        
    }
    
    func areEntriesValid() -> Bool {
        if let view = view as? SMSAuthenticationViewController {
            return view.areEntriesValid()
        }
        return false
    }
    
    func backButtonPressed() {
//        LaunchRouter.shared.dismissLogInSMS()
        delegate?.didPressBackButton(sender: self)
    }
    
    func displayAlert(withTitle title: String, message: String) {
        guard let view = view as? SMSAuthenticationViewController  else {fatalError()}
        view.showAlert(title: title, message: message)
    }
    
    func resendButtonClicked(){
        showLoading()
        guard let view = view as? SMSAuthenticationViewController  else {fatalError()}
        delegate?.didPressResendButton(sender: self) { result in
            self.dismissLoading()
            switch result {
            case .success(_):
                view.showAlert(title: "Success".localized(), message: "coderesent.alert".localized())
            case .failure(let error):
                view.showAlert(error: error)
            }
        }
    }
}
