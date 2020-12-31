//
//  LogInViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//

import UIKit

class LogInViewController: BaseViewController {
    
    
    
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var continuePasswordButton: UIButton!
    @IBOutlet weak var continueSMSButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        
        continuePasswordButton.layer.cornerRadius = continuePasswordButton.frame.size.height / 2
        continueSMSButton.layer.cornerRadius = continueSMSButton.frame.size.height / 2
        
        hideKeyboardWhenTappedAround()
        
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
   
}

