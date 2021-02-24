//
//  GenderTextField.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 24/02/2021.
//

import UIKit

class GenderTextField: CustomFloatingPlaceholderTextField {

    override func setup() {
        validatedFloatingText = placeholder
        unvalidatedFloatingText = "الرجاء الاختيار"
        super.setup()
    }

}
