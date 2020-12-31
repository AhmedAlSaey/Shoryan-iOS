//
//  Views.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 30/12/2020.
//

import UIKit

extension UIView {
    enum Corner {
        case Top
        case Bottom
        
    }
    
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .init(width: 0, height: 3)
        layer.shadowRadius = 2
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func addSpecificCornerRadius(forCorners corners: Corner, radius: CGFloat){
        clipsToBounds = true
        layer.cornerRadius = radius
        
        if corners == .Top {
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else if corners == .Bottom {
            layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        }
        
    }
}
