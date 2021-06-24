//
//  BirthDateTextField.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 24/02/2021.
//

import UIKit

class BirthDateTextField: CustomFloatingPlaceholderTextField {

    override func setup() {
        unvalidatedFloatingText = "birthdate.unvalidatedplaceholder".localized()
        super.setup()
    }

}
