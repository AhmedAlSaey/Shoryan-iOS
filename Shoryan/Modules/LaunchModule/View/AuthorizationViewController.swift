//
//  AuthorizationViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//

import UIKit

class AuthorizationViewController: BaseViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        logInButton.layer.cornerRadius = logInButton.frame.size.height / 2
        logInButton.layer.borderWidth = 1
        logInButton.layer.borderColor = UIColor.white.cgColor
        
        signUpButton.layer.cornerRadius = signUpButton.frame.size.height / 2
        makeNavigationBarTransparent()
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    override func localizeAssets() {
        logoImage.image = UIImage(named: "logo-picture".localized())
    }
    
    override func localizeStrings() {
        logInButton.setTitle("login.button".localized(), for: .normal)
        signUpButton.setTitle("register.button".localized(), for: .normal)
    }


    @IBAction func didClickLogInButton(_ sender: UIButton) {
        (presenter as? AuthorizationPresenter)?.logInButtonClicked()
    }
    @IBAction func didClickSignUpButton(_ sender: UIButton) {
        (presenter as? AuthorizationPresenter)?.signUpButtonClicked()
    }
    

}
