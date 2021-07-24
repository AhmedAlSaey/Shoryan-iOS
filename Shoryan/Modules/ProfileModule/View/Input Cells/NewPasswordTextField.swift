//
//  NewPasswordTextField.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 22/07/2021.
//

import Foundation

class NewPasswordTextField: CustomFloatingPlaceholderTextField {
    override func setup() {
        unvalidatedFloatingText = "password.unvalidatedplaceholder".localized()
        super.setup()
    }
}
