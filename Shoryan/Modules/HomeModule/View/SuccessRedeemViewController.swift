//
//  SuccessRedeemViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 26/06/2021.
//

import UIKit

class SuccessRedeemViewController: BaseViewController {

    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var navBarTitle: UILabel!
    @IBOutlet weak var successTitle: UILabel!
    @IBOutlet weak var successDescription: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleNavigationBar()
        closeButton.layer.cornerRadius = closeButton.frame.height/2
    }
    
    func styleNavigationBar() {
        //        let barHeight = navigationController?.navigationBar.layer.frame.height ?? 0
        //        navBarTopConstraint.constant -= barHeight
                navigationBarView.addSpecificCornerRadius(forCorners: .Bottom, radius: 20)
    }
    
    override func localizeStrings() {
        navBarTitle.text = "successnavbartitle.label".localized()
        successTitle.text = "successtitle.label".localized()
        successDescription.text = "successdescription.label".localized()
        closeButton.setTitle("Close".localized(), for: .normal)
    }

    
    @IBAction func closeButtonPressed(_ sender: Any) {
        if let presenter = presenter as? SuccessRedeemPresenter {
            presenter.closeButtonPressed()
        }
    }
}
