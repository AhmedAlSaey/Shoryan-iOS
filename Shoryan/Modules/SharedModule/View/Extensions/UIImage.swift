//
//  UIImage.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import UIKit

extension UIImageView {
    func applyshadowWithCorner(containerView : UIView, cornerRadius : CGFloat, shadowWidth: Int = 2, shadowHeight: Int = 2){
        containerView.clipsToBounds = false
        containerView.layer.cornerRadius = cornerRadius
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = .init(width: shadowWidth, height: shadowHeight)
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowRadius = 2
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
}
