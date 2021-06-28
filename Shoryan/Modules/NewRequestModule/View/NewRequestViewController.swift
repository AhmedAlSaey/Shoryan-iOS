//
//  NewRequestViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import UIKit

class NewRequestViewController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var navBarTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var stateDropdownImage: UIImageView!
    @IBOutlet weak var stateView: UIView!
    @IBOutlet weak var bloodBagsLabel: UILabel!
    
    
    @IBOutlet weak var governoratesTextField: UITextField!
    @IBOutlet weak var governoratesDropdownImage: UIImageView!
    @IBOutlet weak var governoratesView: UIView!
    @IBOutlet weak var regionTextField: UITextField!
    @IBOutlet weak var regionDropdownImage: UIImageView!
    @IBOutlet weak var regionView: UIView!
    @IBOutlet weak var bloodBankTextField: UITextField!
    @IBOutlet weak var bloodBankDropdownImage: UIImageView!
    @IBOutlet weak var bloodBankView: UIView!
    
    @IBOutlet weak var requestButton: UIButton!
    
    var governoratePickView: UIPickerView = UIPickerView()
    var regionPickerView: UIPickerView = UIPickerView()
    var bloodBankPickerView: UIPickerView = UIPickerView()
    
    var governorates: [String]? {
        didSet {
            if isViewLoaded {
                governoratePickView.reloadAllComponents()
            }
        }
    }
    var regions: [String]? {
        didSet {
            if isViewLoaded {
                regionPickerView.reloadAllComponents()
            }
        }
    }
    var bloodBanks: [String]? {
        didSet {
            if isViewLoaded {
                bloodBankPickerView.reloadAllComponents()
            }
        }
    }
    
    
    var currentlySelectedBloodTypeButton: BloodTypeSelectionButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        styleNavigationBar()
        styleButtons()
        setupLocationInputViews()
    }

    func styleNavigationBar() {
//        let barHeight = navigationController?.navigationBar.layer.frame.height ?? 0
//        navBarTopConstraint.constant -= barHeight
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
    
    func setupLocationInputViews() {
        enableUserInteraction(dropdownImage: governoratesDropdownImage, containerView: governoratesView)
        disableUserInteraction(dropdownImage: regionDropdownImage, containerView: regionView)
        disableUserInteraction(dropdownImage: bloodBankDropdownImage, containerView: bloodBankView)
        
        
        governoratePickView.tag = 1
        governoratePickView.delegate = self
        governoratePickView.dataSource = self
        governoratesTextField.tag = 1
        governoratesTextField.inputView = governoratePickView
        governoratesTextField.delegate = self
        
        regionTextField.tag = 2
        regionPickerView.tag = 2
        regionPickerView.delegate = self
        regionPickerView.dataSource = self
        regionTextField.inputView = regionPickerView
        regionTextField.delegate = self
        
        bloodBankTextField.tag = 3
        bloodBankTextField.inputView = bloodBankPickerView
        bloodBankPickerView.delegate = self
        bloodBankPickerView.dataSource = self
        bloodBankPickerView.tag = 3
        bloodBankTextField.delegate = self
        
    }
    
    func enableUserInteraction(dropdownImage: UIImageView, containerView: UIView){
        containerView.layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = stateView.layer.frame.height / 2
        dropdownImage.image = UIImage(named: "dropdown-arrow-allowed")
        containerView.isUserInteractionEnabled = true
    }
    
    func disableUserInteraction(dropdownImage: UIImageView, containerView: UIView) {
        containerView.layer.borderColor = ThemeConstants.colorLightGray.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = stateView.layer.frame.height / 2
        dropdownImage.image = UIImage(named: "dropdown-arrow-unallowed")
        containerView.isUserInteractionEnabled = true
    }
    
    

    @IBAction func bloodSelectionButtonPressed(_ sender: BloodTypeSelectionButton) {
        if sender.isSelectedBloodType ?? false {
            sender.setUnselected()
            currentlySelectedBloodTypeButton = nil
        }
        else {
            sender.setSelected()
            currentlySelectedBloodTypeButton?.setUnselected()
            currentlySelectedBloodTypeButton = sender
        }
    }
    
    @IBAction func incrementButtonClicked(_ sender: UIButton) {
        if sender.titleLabel?.text == "+" {
            let valueAfterIncrement = Int(bloodBagsLabel.text!)! + 1
            bloodBagsLabel.text = valueAfterIncrement > 10 ? "\(10)" : "\(valueAfterIncrement)"
        }
        else if sender.titleLabel?.text == "-" {
            let valueAfterIncrement = Int(bloodBagsLabel.text!)! - 1
            bloodBagsLabel.text = valueAfterIncrement < 0 ? "\(0)" : "\(valueAfterIncrement)"
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return governorates?.count ?? 0
        }
        else if pickerView.tag == 2 {
            return regions?.count ?? 0
        }
        else if pickerView.tag == 3 {
            return bloodBanks?.count ?? 0
        }
        else {
            fatalError("Unexpected sender")
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            governoratesTextField.text = governorates![row]
        }
        else if pickerView.tag == 2 {
            regionTextField.text = regions![row]
        }
        else if pickerView.tag == 3 {
            bloodBankTextField.text = bloodBanks![row]
        }
        else {
            fatalError("Unexpected sender")
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return governorates![row]
        }
        else if pickerView.tag == 2 {
            return regions![row]
        }
        else if pickerView.tag == 3 {
            return bloodBanks![row]
        }
        else {
            fatalError("Unexpected sender")
        }
    }
    
    

}

extension NewRequestViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField.tag {
        case 1:
            if governoratesTextField.text != "" {
                guard let presenter = presenter as? NewRequestPresenter else {fatalError()}
                presenter.governorateLocationChanged(change: governoratesTextField.text!)
            }
        case 2:
            if regionTextField.text != "" {
                guard let presenter = presenter as? NewRequestPresenter else {fatalError()}
                presenter.regionLocationChanged(change: regionTextField.text!)
            }
        default:
            break;
        }
    }
}
