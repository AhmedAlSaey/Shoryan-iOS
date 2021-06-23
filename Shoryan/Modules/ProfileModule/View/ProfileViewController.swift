//
//  ProfileViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import UIKit

class ProfileViewController: BaseViewController {

    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var navBarTopConstraint: NSLayoutConstraint!
    @IBOutlet var statsView: UIView!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var donationsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        styleNavigationBar()
        styleStatsView()
    }

    func styleNavigationBar() {
//        let barHeight = navigationController?.navigationBar.layer.frame.height ?? 0
//        navBarTopConstraint.constant -= barHeight
        navigationBarView.addSpecificCornerRadius(forCorners: .Bottom, radius: 20)
        pointsLabel.text = pointsLabel.text?.enToArDigits
        donationsLabel.text = donationsLabel.text?.enToArDigits
        
    }
    
    func styleStatsView() {
        statsView.layer.cornerRadius = 37
        statsView.clipsToBounds = true
        statsView.dropShadow()
    }


}
