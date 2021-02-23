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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        styleNavigationBar()
        styleStatsView()
    }

    func styleNavigationBar() {
        let barHeight = navigationController?.navigationBar.layer.frame.height ?? 0
        navBarTopConstraint.constant -= barHeight
        navigationBarView.addSpecificCornerRadius(forCorners: .Bottom, radius: 20)
        
    }
    
    func styleStatsView() {
        statsView.layer.cornerRadius = 37
        statsView.clipsToBounds = true
        statsView.dropShadow()
    }


}
