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
    @IBOutlet weak var languageView: UIView!
    @IBOutlet weak var languageImageView: UIImageView!
    @IBOutlet weak var languageText: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        logInButton.layer.cornerRadius = logInButton.frame.size.height / 2
        logInButton.layer.borderWidth = 1
        logInButton.layer.borderColor = UIColor.white.cgColor
        
        signUpButton.layer.cornerRadius = signUpButton.frame.size.height / 2
        makeNavigationBarTransparent()
        hideKeyboardWhenTappedAround()
        
        languageView.layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        languageView.layer.borderWidth = 1
        languageView.layer.cornerRadius = 17
        languageView.dropShadow(widthOffset: 0, heightOffset: 3)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.languageViewPressed(_:)))
        languageView.addGestureRecognizer(tap)
    }
    
    override func localizeAssets() {
        logoImage.image = UIImage(named: "logo-picture".localized())
        languageImageView.image = UIImage(named: "language-icon".localized())
    }
    
    override func localizeStrings() {
        logInButton.setTitle("login.button".localized(), for: .normal)
        signUpButton.setTitle("register.button".localized(), for: .normal)
        languageText.text = "language-code".localized().uppercased()
    }


    @IBAction func didClickLogInButton(_ sender: UIButton) {
        (presenter as? AuthorizationPresenter)?.logInButtonClicked()
    }
    @IBAction func didClickSignUpButton(_ sender: UIButton) {
        (presenter as? AuthorizationPresenter)?.signUpButtonClicked()
    }
    
    @objc func languageViewPressed(_ sender: UITapGestureRecognizer? = nil) {
        (presenter as? AuthorizationPresenter)?.languageButtonClicked()
    }
    

}
