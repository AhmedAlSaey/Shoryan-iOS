//
//  GenderTextField.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 24/02/2021.
//

import UIKit

class GenderTextField: CustomFloatingPlaceholderTextField {

    override func setup() {
        unvalidatedFloatingText = "gender.unvalidatedplaceholder".localized()
        super.setup()
    }

}
