//
//  LaunchScreenViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//

import UIKit

class LaunchScreenViewController: BaseViewController {
    @IBOutlet weak var splashLogo: UIImageView!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func localizeAssets() {
        splashLogo.image = UIImage(named: "logo-picture".localized())
    }

    
    

}
