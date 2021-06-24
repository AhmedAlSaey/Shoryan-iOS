//
//  PhoneNumberTextField.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 24/02/2021.
//

import UIKit

class PhoneNumberTextField: CustomFloatingPlaceholderTextField {

    override func setup() {
        unvalidatedFloatingText = "phone.unvalidatedplaceholder".localized()
        super.setup()
    }

}
