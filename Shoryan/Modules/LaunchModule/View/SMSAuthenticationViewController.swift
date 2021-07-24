//
//  LogInSMSViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 29/12/2020.
//

import UIKit

class SMSAuthenticationViewController: BaseViewController, UITextFieldDelegate {
    @IBOutlet weak var smsAuthenticationLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var codeInstructionLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var resendButton: UIButton!
    @IBOutlet weak var codeStackView: UIStackView!
    
    
    
    
    
    @IBOutlet weak var code1TF: UnderlinedUITextField!
    @IBOutlet weak var code2TF: UnderlinedUITextField!
    @IBOutlet weak var code3TF: UnderlinedUITextField!
    @IBOutlet weak var code4TF: UnderlinedUITextField!
    
    @IBOutlet weak var phoneTextField: UILabel!
    
   
    var code: String {
        get{
            var result : String = ""
            result += code1TF.text.nonNullString
            result += code2TF.text.nonNullString
            result += code3TF.text.nonNullString
            result += code4TF.text.nonNullString
            return result
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupTextFields()
        
        continueButton.layer.cornerRadius = continueButton.layer.frame.height / 2
        
    }
    
    override func localizeStrings() {
        smsAuthenticationLabel.text = "codeauthintication.label".localized()
        codeInstructionLabel.text = "codeaurthenticationinstruction".localized()
        continueButton.setTitle("Continue".localized(), for: .normal)
        resendButton.setTitle("resendcode.button".localized(), for: .normal)
    }
    
    override func localizeAssets() {
        backButton.setImage(UIImage(named: "back-button".localized()), for: .normal)
    }
    
    override func localizationSettings() {
        codeStackView.semanticContentAttribute = .forceLeftToRight
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func areEntriesValid() -> Bool {
        return !code.isEmpty
    }
    
    
    
    
    func setupTextFields(){
        code1TF.delegate = self
                code2TF.delegate = self
                code3TF.delegate = self
                code4TF.delegate = self


        code1TF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        code2TF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        code3TF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        code4TF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField){

        let text = textField.text.nonNullString

        if text.count >= 1{
            switch textField{
            case code1TF:
                code2TF.becomeFirstResponder()
            case code2TF:
                code3TF.becomeFirstResponder()
            case code3TF:
                code4TF.becomeFirstResponder()
            case code4TF:
                code4TF.resignFirstResponder()
//                code5TF.becomeFirstResponder()
//            case code5TF:
//                code6TF.becomeFirstResponder()
//            case code6TF:
//                code6TF.resignFirstResponder()
            default:
                break
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
            textField.text = ""
        }
    
    
    

    @IBAction func continueButtonPressed(_ sender: UIButton) {
        if let presenter = presenter as? SMSAuthenticationPresenter {
            presenter.didClickContinue(withCode: code)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if let presenter = presenter as? SMSAuthenticationPresenter {
            presenter.backButtonPressed()
        }
    }
    
    @IBAction func resendButtonClicked(_ sender: Any) {
        if let presenter = presenter as? SMSAuthenticationPresenter {
            presenter.resendButtonClicked()
        }
    }
    

}
