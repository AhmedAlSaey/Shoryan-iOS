//
//  OldPasswordTextField.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 22/07/2021.
//

import UIKit

class OldPasswordTextField: CustomFloatingPlaceholderTextField {
    override func setup() {
        unvalidatedFloatingText = "password.unvalidatedplaceholder".localized()
        super.setup()
    }
}
