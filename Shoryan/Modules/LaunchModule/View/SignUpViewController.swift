//
//  SignUpViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 30/12/2020.
//

import UIKit

class SignUpViewController: BaseViewController {
    @IBOutlet weak var dayView: UIView!
    @IBOutlet weak var monthView: UIView!
    @IBOutlet weak var yearView: UIView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var cardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }
    
    func style() {
        addRedBorder(view: dayView)
        addRedBorder(view: monthView)
        addRedBorder(view: yearView)
        
        continueButton.layer.cornerRadius = continueButton.layer.frame.height / 2
        
        cardView.dropShadow(scale: true)
        cardView.addSpecificCornerRadius(forCorners: .Top, radius: 60)
    }
    
    func addRedBorder(view: UIView){
        view.layer.borderWidth = 1
        view.layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
    }
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        if let presenter = presenter as? SignUpPresenter {
            presenter.continueClicked()
        }
    }
    


    

}
