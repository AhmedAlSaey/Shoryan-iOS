//
//  LocationTextField.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 24/02/2021.
//

import UIKit

class LocationTextField: CustomFloatingPlaceholderTextField {

    override func setup() {
        unvalidatedFloatingText = "location.unvalidatedplaceholder".localized()
        super.setup()
    }

}
