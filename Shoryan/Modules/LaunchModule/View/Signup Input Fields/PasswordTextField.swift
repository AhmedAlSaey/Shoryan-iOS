//
//  PasswordTextField.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 24/02/2021.
//

import UIKit

class PasswordTextField: CustomFloatingPlaceholderTextField {

    override func setup() {
        unvalidatedFloatingText = "password.unvalidatedplaceholder".localized()
        super.setup()
    }

}
