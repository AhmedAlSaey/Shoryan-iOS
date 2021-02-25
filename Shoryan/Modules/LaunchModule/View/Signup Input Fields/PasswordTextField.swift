//
//  PasswordTextField.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 24/02/2021.
//

import UIKit

class PasswordTextField: CustomFloatingPlaceholderTextField {

    override func setup() {
        validatedFloatingText = placeholder
        unvalidatedFloatingText = "الرجاء اختيار كلمة سر تحتوي علي [A-Z]، [a-z]، [0-9]"
        super.setup()
    }

}
