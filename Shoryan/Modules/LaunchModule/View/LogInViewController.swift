//
//  LogInViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//

import UIKit

class LogInViewController: BaseViewController {
    
    
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        
        continueButton.layer.cornerRadius = continueButton.frame.size.height / 2
        makeNavigationBarTransparent()
        hideKeyboardWhenTappedAround()
        
    }


    @IBAction func continueButtonClicked(_ sender: UIButton) {
        
    }
   
}

