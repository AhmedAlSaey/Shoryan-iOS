//
//  PhoneNumberTextField.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 24/02/2021.
//

import UIKit

class PhoneNumberTextField: CustomFloatingPlaceholderTextField {

    override func setup() {
        validatedFloatingText = placeholder
        unvalidatedFloatingText = "الرجاء ادخال رقم مصري"
        super.setup()
    }

}
