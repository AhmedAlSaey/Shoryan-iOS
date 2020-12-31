//
//  BloodTypeSelectionButton.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import UIKit

class BloodTypeSelectionButton: UIButton {

    var isSelectedBloodType: Bool = false
    
    override func draw(_ rect: CGRect) {
        setUnselected()
        layer.cornerRadius = 15
    }
    
    func setUnselected() {
        isSelectedBloodType = false
        backgroundColor = ThemeConstants.colorShoryanMain
        layer.borderWidth = 1
        layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        setTitleColor(ThemeConstants.colorShoryanMain, for: .normal)
    }
    
    func setSelected() {
        isSelectedBloodType = false
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        setTitleColor(.white, for: .normal)
    }

}
