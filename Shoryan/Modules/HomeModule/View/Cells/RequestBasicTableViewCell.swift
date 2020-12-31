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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel?.text = name
        bloodTypeLabel?.text = bloodType
        locationLabel?.text = location
        
        containerView.layer.cornerRadius = 21
        containerView.dropShadow()
        
        bloodTypeBackgroudView.layer.cornerRadius = bloodTypeBackgroudView.layer.frame.size.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
