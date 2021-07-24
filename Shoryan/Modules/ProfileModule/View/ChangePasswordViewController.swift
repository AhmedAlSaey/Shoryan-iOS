//
//  ChangePasswordViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 22/07/2021.
//

import UIKit

class ChangePasswordViewController: BaseViewController {

    @IBOutlet weak var changePasswordLabel: UILabel!
    @IBOutlet weak var oldPasswordTextField: OldPasswordTextField!
    @IBOutlet weak var newPasswordTextField: NewPasswordTextField!
    @IBOutlet weak var passwordConfirmationTextField: PasswordConfirmationTextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }
    
    override func localizeStrings() {
        changePasswordLabel.text = "changepassword.label".localized()
        oldPasswordTextField.placeholder = "oldpassword.placeholder".localized()
        newPasswordTextField.placeholder = "newpassword.placeholder".localized()
        passwordConfirmationTextField.placeholder = "confirmpassword.placeholder".localized()
        saveButton.setTitle("Save".localized(), for: .normal)
    }
    
    func style() {
        saveButton.layer.cornerRadius = saveButton.layer.frame.height / 2
    }
    
    override func localizeAssets() {
        backButton.setImage(UIImage(named: "back-arrow-red".localized()), for: .normal)
    }
    
    func isAllInputValid() -> Bool {
        return oldPasswordTextField.isValidEntry && newPasswordTextField.isValidEntry && passwordConfirmationTextField.isValidEntry && (newPasswordTextField.text == passwordConfirmationTextField.text)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if let presenter = presenter as? ChangePasswordPresenter {
            presenter.backButtonPressed()
        }
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        if let presenter = presenter as? ChangePasswordPresenter {
            presenter.saveClicked(oldPassword: oldPasswordTextField.text!, newPassword: newPasswordTextField.text!, passwordConfirmation: passwordConfirmationTextField.text!)
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
