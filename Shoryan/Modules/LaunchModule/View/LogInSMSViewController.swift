//
//  LogInSMSViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 29/12/2020.
//

import UIKit

class LogInSMSViewController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var code1TF: UITextField!
    @IBOutlet weak var code2TF: UITextField!
    @IBOutlet weak var code3TF: UITextField!
    @IBOutlet weak var code4TF: UITextField!
    
    @IBOutlet weak var phoneTextField: UILabel!
    
    @IBOutlet weak var continueButton: UIButton!
    
    var code: String {
        get{
            code1TF.text.nonNullString + code2TF.text.nonNullString + code3TF.text.nonNullString + code4TF.text.nonNullString
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupTextFields()
        
        continueButton.layer.cornerRadius = continueButton.layer.frame.height / 2
        
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
            default:
                break
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
            textField.text = ""
        }
    
    
    

    @IBAction func continueButtonPressed(_ sender: UIButton) {
        if let presenter = presenter as? LogInSMSPresenter {
            presenter.didClickContinueFromSMSLogIn(withCode: code)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if let presenter = presenter as? LogInSMSPresenter {
            presenter.backButtonPressed()
        }
    }
    
    

}
