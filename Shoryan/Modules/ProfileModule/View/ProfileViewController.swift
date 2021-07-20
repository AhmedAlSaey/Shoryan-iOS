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
    @IBOutlet weak var pointsCountLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var donationsCountLabel: UILabel!
    @IBOutlet weak var donationsLabel: UILabel!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var accountInfoCell: UIView!
    @IBOutlet weak var accountInfoLabel: UILabel!
    @IBOutlet weak var accountInfoNavArrow: UIImageView!
    
    @IBOutlet weak var changePasswordCell: UIView!
    @IBOutlet weak var changePasswordLabel: UILabel!
    @IBOutlet weak var changePasswordNavArrow: UIImageView!
    
    @IBOutlet weak var languageCell: UIView!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var languageNavArrow: UIImageView!
    @IBOutlet weak var currentLanguageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleUI()
        setup()
    }
    
    override func localizeStrings() {
        greetingLabel.text = "Hello".localized()
        donationsLabel.text = "Donations".localized()
        pointsLabel.text = "Points".localized()
        accountInfoLabel.text = "accountinfo.label".localized()
        changePasswordLabel.text = "changepassword.label".localized()
        languageLabel.text = "language.label".localized()
        currentLanguageLabel.text = "language-name".localized()
        logoutButton.setTitle("logout.button".localized(), for: .normal)
    }
    
    override func localizeAssets() {
        accountInfoNavArrow.image = UIImage(named: "nav-arrow".localized())
        changePasswordNavArrow.image = UIImage(named: "nav-arrow".localized())
        languageNavArrow.image = UIImage(named: "nav-arrow".localized())
    }
    
    func styleUI() {
        styleNavigationBar()
        styleStatsView()
        
        logoutButton.layer.borderWidth = 2
        logoutButton.layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        logoutButton.layer.cornerRadius = logoutButton.frame.height / 2

    }

    func styleNavigationBar() {
//        let barHeight = navigationController?.navigationBar.layer.frame.height ?? 0
//        navBarTopConstraint.constant -= barHeight
        navigationBarView.addSpecificCornerRadius(forCorners: .Bottom, radius: 20)
        pointsCountLabel.text = pointsCountLabel.text?.localizeDigits
        donationsCountLabel.text = donationsCountLabel.text?.localizeDigits
        
    }
    
    func styleStatsView() {
        statsView.layer.cornerRadius = 37
        statsView.clipsToBounds = true
        statsView.dropShadow()
    }
    
    func setup() {
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.accountInfoCellClicked(_:)))
        accountInfoCell.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.changePassworkCellClicked(_:)))
        changePasswordCell.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.languageCellClicked(_:)))
        languageCell.addGestureRecognizer(tap3)
    }
    
    @objc func accountInfoCellClicked(_ sender: UITapGestureRecognizer? = nil) {
        
    }
    
    @objc func changePassworkCellClicked(_ sender: UITapGestureRecognizer? = nil) {
        
    }

    @objc func languageCellClicked(_ sender: UITapGestureRecognizer? = nil) {
        guard let presenter = presenter as? ProfilePresenter else {return}
        presenter.languageButtonClicked()
    }
    
    @IBAction func logoutButtonClicked(_ sender: Any) {
        guard let presenter = presenter as? ProfilePresenter else {return}
        presenter.logoutButtonClicked()
    }
    

}
