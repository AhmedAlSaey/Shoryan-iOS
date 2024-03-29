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
        case Right
        case Left
    }
    
    func dropShadow(scale: Bool = true, widthOffset: Int = 0, heightOffset: Int = 3) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .init(width: widthOffset, height: heightOffset)
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
        else if corners == .Right {
            if UIApplication.shared.userInterfaceLayoutDirection == .leftToRight {
                layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            }
            else{
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            }
        }
        else if corners == .Left {
            if UIApplication.shared.userInterfaceLayoutDirection == .leftToRight {
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            }
            else{
                layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            }
        }
        
    }
}
