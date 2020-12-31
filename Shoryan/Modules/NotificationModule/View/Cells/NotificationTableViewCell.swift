//
//  NotificationTableViewCell.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var notificationTitleLabel: UILabel!
    @IBOutlet weak var notificationDescriptionLabel: UILabel!
    @IBOutlet weak var notificationTimeLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    
    var notificationTitle: String? {
        didSet {
            notificationTitleLabel?.text = notificationTitle
        }
    }
    var notificationDescription: String? {
        didSet {
            notificationDescriptionLabel?.text = notificationDescription
        }
    }
    var notificationTime: String? {
        didSet {
            notificationTimeLabel?.text = notificationTime
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        notificationTitleLabel?.text = notificationTitle
        notificationDescriptionLabel?.text = notificationDescription
        notificationTimeLabel?.text = notificationTime
        
        containerView.layer.cornerRadius = 21
        containerView.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
