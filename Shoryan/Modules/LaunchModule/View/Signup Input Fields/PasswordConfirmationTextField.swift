//
//  PasswordConfirmationTextField.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 24/02/2021.
//

import UIKit

class PasswordConfirmationTextField: CustomFloatingPlaceholderTextField {

    override var isValidEntry: Bool {
        get {
            if let text = self.text {
                
                return validate?(text) ?? true && passwordMatched()
            }
            return true
        }
    }
    var mainPasswordTextField: UITextField?
    override func setup() {
        validatedFloatingText = placeholder
        unvalidatedFloatingText = "الرجاء التأكد من صحة تأكيد كلمة المرور"
        super.setup()
    }
    
    func passwordMatched() -> Bool {
        if let mainPassword = mainPasswordTextField?.text, let confirmationPassword = self.text {
            return mainPassword == confirmationPassword
        }
        return true
    }
    
    

}
