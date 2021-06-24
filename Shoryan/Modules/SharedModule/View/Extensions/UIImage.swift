//
//  UIImage.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import UIKit

extension UIImageView {
    func applyshadowWithCorner(containerView : UIView, cornerRadius : CGFloat){
        containerView.clipsToBounds = false
        containerView.layer.cornerRadius = cornerRadius
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = .init(width: 2, height: 2)
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowRadius = 1
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
}
