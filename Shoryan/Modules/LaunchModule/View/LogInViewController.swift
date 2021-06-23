//
//  LogInViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//

import UIKit

class LogInViewController: BaseViewController {
    
    
    
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var passwordLoginButton: UIButton!
    @IBOutlet weak var smsLoginButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    
    
    @IBOutlet weak var continuePasswordButton: UIButton!
    @IBOutlet weak var continueSMSButton: UIButton!
    @IBOutlet weak var phoneTextField: PhoneNumberTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        
        continuePasswordButton.layer.cornerRadius = continuePasswordButton.frame.size.height / 2
        continueSMSButton.layer.cornerRadius = continueSMSButton.frame.size.height / 2
        
    }
    
    override func localizeStrings() {
        loginLabel.text = "login.label".localized()
        phoneNumberLabel.text = "mobilenumber.label".localized()
        passwordLoginButton.setTitle("loginpassword.button".localized(), for: .normal)
        smsLoginButton.setTitle("loginsms.button".localized(), for: .normal)
    }
    
    override func localizeAssets() {
        backButton.setImage(UIImage(named: "back-button".localized()), for: .normal)
    }
    
    func areEntriesValid() -> Bool {
        return phoneTextField.isValidEntry
    }


    @IBAction func continueWithPasswordClicked(_ sender: UIButton) {
        if let presenter = presenter as? LogInPresenter? {
            presenter?.logInWithPasswordClicked(phoneNumber: numberTextField.text.nonNullString)
        }
    }
    @IBAction func continueWithSMSClicked(_ sender: UIButton) {
        if let presenter = presenter as? LogInPresenter? {
            presenter?.logInWithSMSClicked(phoneNumber: numberTextField.text.nonNullString)
        }
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        if let presenter = presenter as? LogInPresenter {
            presenter.backButtonClicked()
        }
    }
    
   
}

