//
//  ThemeConstants.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//

import UIKit


struct ThemeConstants {
    // MARK: - Colors
    
    // Main
    static let colorShoryanMain               = UIColor(red:0.61, green:0.06, blue:0.06, alpha:1)
    
    // Grey
    // Grays
    static let colorDarkGray                = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1)
    static let colorMediumGray                = UIColor(red:0.60, green:0.60, blue:0.60, alpha:1)
    static let colorLightGray                = UIColor(red:0.86, green:0.86, blue:0.86, alpha:1)
    static let colorGreyishBrown            = UIColor(white: 74.0 / 255.0, alpha: 1.0)
    
    // MARK: - Fonts
    
    static func fontRegular(size:Float) -> UIFont {
        return font(name: "ArialMT", size: size)
    }
    static func fontBold(size:Float) -> UIFont {
        return font(name: "Arial-BoldMT", size: size)
    }
    
    static func font(name:String, size:Float) -> UIFont {
        return UIFont(name: name, size: CGFloat(size))!
    }
    static func attributes(fontSize:CGFloat, color:UIColor) -> [NSAttributedString.Key : Any] {
        return [NSAttributedString.Key.font : ThemeConstants.fontRegular(size: Float(fontSize)), NSAttributedString.Key.foregroundColor : color]
    }
    static func attributes(font:UIFont, color:UIColor) -> [NSAttributedString.Key : Any] {
        return [NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor : color]
    }
    
    static func globalApplicationTheming() {
        // Navigation Bar
//        UINavigationBar.appearance().shadowImage = UIImage()
//        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.font : ThemeConstants.fontRegular(size: 16),
            NSAttributedString.Key.foregroundColor : ThemeConstants.colorDarkGray
        ]
//        if #available(iOS 11.0, *) {
//            UINavigationBar.appearance().largeTitleTextAttributes = [
//                NSAttributedString.Key.font : ThemeConstants.fontHeavy(size: 28),
//                NSAttributedString.Key.foregroundColor : ThemeConstants.colorDarkGray
//            ]
//        }
//        UINavigationBar.appearance().setTitleVerticalPositionAdjustment(2.0, for:.default)
//
//        // Bars
        UIBarButtonItem.appearance().tintColor = .white
        
//        // Tab Bar
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().tintColor = ThemeConstants.colorShoryanMain
        UITabBar.appearance().barTintColor = .white
        if #available(iOS 10.0, *) {
            UITabBar.appearance().unselectedItemTintColor = ThemeConstants.colorMediumGray
        }
        UITabBarItem.appearance().setTitleTextAttributes(ThemeConstants.attributes(
            font:ThemeConstants.fontRegular(size: 10),
            color: ThemeConstants.colorMediumGray), for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(ThemeConstants.attributes(
            font:ThemeConstants.fontRegular(size: 10),
            color: ThemeConstants.colorMediumGray), for: .selected)
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -9.0)
        
        
////        UITabBarItem.appearance().imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 2, right: 0)    // this line causes a known crash in UIKit
    }
    
    static func addShadowToView(view : UIView?) {
        view?.layer.shadowOffset = CGSize(width: 0, height: -1)
        view?.layer.shadowColor = ThemeConstants.colorLightGray.cgColor
        view?.layer.shadowRadius = 1
        view?.layer.shadowOpacity = 1
    }
    
   
}
