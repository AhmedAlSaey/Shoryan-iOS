//
//  NewRequestViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import UIKit

class NewRequestViewController: BaseViewController {

    @IBOutlet weak var navBarTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var stateDropdownImage: UIImageView!
    @IBOutlet weak var stateView: UIView!
    
    @IBOutlet weak var regionTextField: UITextField!
    @IBOutlet weak var regionDropdownImage: UIImageView!
    @IBOutlet weak var regionView: UIView!
    
 
    @IBOutlet weak var bloodBankTextField: UITextField!
    @IBOutlet weak var bloodBankDropdownImage: UIImageView!
    @IBOutlet weak var bloodBankView: UIView!
    
    @IBOutlet weak var requestButton: UIButton!
    
    @IBOutlet weak var aPositiveButton: BloodTypeSelectionButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleNavigationBar()
        styleButtons()
        styleLocationInputViews()
    }

    func styleNavigationBar() {
        let barHeight = navigationController?.navigationBar.layer.frame.height ?? 0
        navBarTopConstraint.constant -= barHeight
        navigationBarView.addSpecificCornerRadius(forCorners: .Bottom, radius: 20)
    }
    
    func styleButtons() {
        minusButton.layer.cornerRadius = 15
        minusButton.layer.borderWidth = 2
        minusButton.layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        
        plusButton.layer.cornerRadius = 15
        plusButton.layer.borderWidth = 2
        plusButton.layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        
        requestButton.layer.cornerRadius = requestButton.layer.frame.height / 2
        
    }
    
    func styleLocationInputViews() {
        stateView.layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        stateView.layer.borderWidth = 1
        stateView.layer.cornerRadius = stateView.layer.frame.height / 2
        stateDropdownImage.image = UIImage(named: "iconfinder_nav-arrow-right_-15")
        
        regionView.layer.borderColor = ThemeConstants.colorLightGray.cgColor
        regionView.layer.borderWidth = 1
        regionView.layer.cornerRadius = stateView.layer.frame.height / 2
        regionDropdownImage.image = UIImage(named: "iconfinder_nav-arrow-right_-16")
        regionTextField.isUserInteractionEnabled = false
        
        bloodBankView.layer.borderColor = ThemeConstants.colorLightGray.cgColor
        bloodBankView.layer.borderWidth = 1
        bloodBankView.layer.cornerRadius = stateView.layer.frame.height / 2
        bloodBankDropdownImage.image = UIImage(named: "iconfinder_nav-arrow-right_-16")
        bloodBankTextField.isUserInteractionEnabled = false
    }

    @IBAction func bloodSelectionButtonPressed(_ sender: BloodTypeSelectionButton) {
        aPositiveButton.setSelected()
    }
    

}
