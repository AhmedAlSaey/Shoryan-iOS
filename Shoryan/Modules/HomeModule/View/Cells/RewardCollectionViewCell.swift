//
//  RewardCollectionViewCell.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 26/06/2021.
//

import UIKit
import Kingfisher

class RewardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var pointsLabel: UILabel!
    
    var imageURL: String? {
        didSet{
            imageView.kf.setImage(with: URL(string: imageURL!))
        }
    }
    var points: Int? {
        didSet {
            pointsLabel.text = "\(points!) ".localizeDigits + "Points".localized().lowercased()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.applyshadowWithCorner(containerView: imageContainerView, cornerRadius: 21, shadowWidth: 0, shadowHeight: 2)
        cellBackgroundView.layer.cornerRadius = 21
        cellBackgroundView.dropShadow( widthOffset: 0, heightOffset: 2)
        // Initialization code
    }
    
    

}
