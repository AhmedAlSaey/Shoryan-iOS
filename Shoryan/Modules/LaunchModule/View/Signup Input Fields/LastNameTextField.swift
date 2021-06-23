//
//  LastNameTextField.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 24/02/2021.
//

import UIKit

class LastNameTextField: CustomFloatingPlaceholderTextField {

    override func setup() {
        validatedFloatingText = placeholder
        unvalidatedFloatingText = "الرجاء ادخال اسم عربي او انجليزي"
        super.setup()
    }

}
