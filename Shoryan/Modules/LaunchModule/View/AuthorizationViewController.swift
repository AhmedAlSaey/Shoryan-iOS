//
//  AuthorizationViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//

import UIKit

class AuthorizationViewController: BaseViewController {

    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        logInButton.layer.cornerRadius = logInButton.frame.size.height / 2
        signUpButton.layer.cornerRadius = signUpButton.frame.size.height / 2
        makeNavigationBarTransparent()
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }


    @IBAction func didClickLogInButton(_ sender: UIButton) {
        (presenter as? AuthorizationPresenter)?.logInButtonClicked()
    }
    @IBAction func didClickSignUpButton(_ sender: UIButton) {
        (presenter as? AuthorizationPresenter)?.signUpButtonClicked()
    }
    

}
