//
//  BloodTypeTextField.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 24/02/2021.
//

import UIKit

class BloodTypeTextField: CustomFloatingPlaceholderTextField {

    override func setup() {
        unvalidatedFloatingText = "bloodtype.unvalidatedplaceholder".localized()
        super.setup()
    }

}
