//
//  LogInPasswordViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 29/12/2020.
//

import UIKit

class LogInPasswordViewController: BaseViewController {
    
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLoginInstructionLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var password: PasswordTextField!
    @IBOutlet weak var phoneTextField: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        continueButton.layer.cornerRadius = continueButton.layer.frame.height / 2
        
        // Do any additional setup after loading the view.
    }
    
    override func localizeStrings() {
        loginLabel.text = "login.label".localized()
        passwordLoginInstructionLabel.text = "loginpasswordinstructions.label".localized()
        passwordLabel.text = "password.label".localized()
        password.placeholder = "password.placeholder".localized()
        continueButton.setTitle("Continue".localized(), for: .normal)
    }
    
    override func localizeAssets() {
        backButton.setImage(UIImage(named: "back-button".localized()), for: .normal)
    }
    
    func areEntriesValid() -> Bool {
        return password.isValidEntry
    }
    

    @IBAction func didClickContinue(_ sender: UIButton) {
        if let presenter = presenter as? LogInPasswordPresenter {
            presenter.didClickContinueFromPasswordLogIn(withPassword: password.text.nonNullString)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if let presenter = presenter as? LogInPasswordPresenter {
            presenter.backButtonPressed()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
