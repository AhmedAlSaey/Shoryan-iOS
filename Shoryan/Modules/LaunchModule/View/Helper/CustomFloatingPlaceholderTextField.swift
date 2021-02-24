//
//  CustomFloatingPlaceholderTextField.swift
//  ouihop
//
//  Created by Ahmed AlSai on 9/4/19.
//  Copyright © 2019 Coformatique. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField

protocol CustomFloatingPlaceholderTextFieldDelegate {
    
    func didValidateEntry (textfield : CustomFloatingPlaceholderTextField) -> ()
    func didInvalidateEntry (textfield : CustomFloatingPlaceholderTextField) -> ()
}
extension CustomFloatingPlaceholderTextFieldDelegate {
    func didValidateEntry(textfield : CustomFloatingPlaceholderTextField){
        //Intentionally left empty
    }
    func didInvalidateEntry(textfield : CustomFloatingPlaceholderTextField){
        //Intentionally left empty
    }
}

class CustomFloatingPlaceholderTextField: JVFloatLabeledTextField {

    var validate : ((String) -> (Bool))?
    var isValidEntry : Bool {
        get {
            if let text = self.text {
                return validate?(text) ?? true
            }
            return true
        }
    }
    var wasValid : Bool!
    var shouldCheckForEveryLetter : Bool = false
    var unvalidatedFloatingText : String?
    var validatedFloatingText : String?
    
    var validationDelegate : CustomFloatingPlaceholderTextFieldDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        addTarget(self, action: #selector(didEndEditing), for: .editingDidEnd)
        addTarget(self, action: #selector(didChangeEditing), for: .editingChanged)
        validatedFloatingText = placeholder
        updateUIForValidEntry()
    }
    
    @objc func didEndEditing() {
        if shouldCheckForEveryLetter == false {
            triggerValidation()
        }
        shouldCheckForEveryLetter = true
    }
    
    @objc func didChangeEditing() {
        if shouldCheckForEveryLetter == true {
            triggerValidation()
        }
    }
    
    func triggerValidation() {
        if isValidEntry && (wasValid == nil || !wasValid){
            updateUIForValidEntry()
            validationDelegate?.didValidateEntry(textfield: self)
            wasValid = true
        }
        else if !isValidEntry && (wasValid == nil || wasValid){
            updateUIForInvalidEntry()
            validationDelegate?.didInvalidateEntry(textfield: self)
            wasValid = false
        }
    }
    
    func updateUIForInvalidEntry(){
        self.floatingLabelActiveTextColor = UIColor.red
        self.floatingLabelTextColor = UIColor.red
        self.floatingLabel.text = unvalidatedFloatingText
        self.layoutSubviews()
    }
    func updateUIForValidEntry(){
        self.floatingLabelActiveTextColor = ThemeConstants.colorDarkGray
        self.floatingLabelTextColor = ThemeConstants.colorDarkGray
        self.floatingLabel.text = validatedFloatingText
        self.layoutSubviews()
    }
    
    
    
    
    
    
    
    

}
