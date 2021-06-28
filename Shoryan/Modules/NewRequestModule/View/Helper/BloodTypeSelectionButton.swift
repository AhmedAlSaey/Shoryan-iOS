//
//  BloodTypeSelectionButton.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import UIKit

class BloodTypeSelectionButton: UIButton {

    var isSelectedBloodType: Bool?
    
    override func draw(_ rect: CGRect) {
        if isSelectedBloodType == nil || isSelectedBloodType == false {
            setUnselected()
            isSelectedBloodType = false
        }
        layer.cornerRadius = 15
        clipsToBounds = true
    }
    
    func setSelected() {
        isSelectedBloodType = true
        backgroundColor = ThemeConstants.colorShoryanMain
        layer.borderWidth = 1
        layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        setTitleColor(.white, for: .normal)
    }
    
    func setUnselected() {
        isSelectedBloodType = false
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        setTitleColor(ThemeConstants.colorShoryanMain, for: .normal)
    }

}
