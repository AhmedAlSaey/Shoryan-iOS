//
//  RequestBasicTableViewCell.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import UIKit

class RequestBasicTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bloodTypeBackgroudView: UIView!
    
    @IBOutlet weak var bloodTypeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var navigationArrowImageView: UIImageView!
    @IBOutlet weak var urgentView: UIView!
    @IBOutlet weak var urgentLabel: UILabel!
    
    
    var name: String? {
        didSet{
            nameLabel?.text = name
        }
    }
    var bloodType: String?{
        didSet{
            bloodTypeLabel?.text = bloodType
        }
    }
    var location: String?{
        didSet{
            locationLabel?.text = location
        }
    }
    
    var urgent: Bool? {
        didSet{
            urgentView.isHidden = !urgent!
            nameLabel.isHidden = urgent!
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel?.text = name
        bloodTypeLabel?.text = bloodType
        locationLabel?.text = location
        
        containerView.layer.cornerRadius = 21
        containerView.dropShadow()
        
        bloodTypeBackgroudView.layer.cornerRadius = bloodTypeBackgroudView.layer.frame.size.height / 2
        urgentView.addSpecificCornerRadius(forCorners: .Bottom, radius: 10)
        urgentView.isHidden = true
        
        localizeAssets()
        localizeStrings()
    }
    
    func localizeStrings() {
        urgentLabel.text = "Urgent".localized().uppercased()
    }
    
    func localizeAssets() {
        navigationArrowImageView.image = UIImage(named: "simple-request-nav-arrow".localized())
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
