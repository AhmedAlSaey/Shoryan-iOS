//
//  SignUpViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 30/12/2020.
//

import UIKit

class SignUpViewController: BaseViewController {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var dateTextField: UITextField!
    var birthDatePickView: UIDatePicker = UIDatePicker()
    
    
    @IBOutlet weak var bloodTypeTextField: UITextField!
    var bloodTypePickerView: UIPickerView = UIPickerView()
    var bloodTypes: [String]? {
        didSet {
            bloodTypePickerView.reloadAllComponents()
        }
    }
    
    
    @IBOutlet weak var maleRadiobutton: UIButton!
    @IBOutlet weak var femaleRadioButton: UIButton!
    var selectedGender: String?
    
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var cardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        configureTextFields()
    }
    
    func configureTextFields() {
        birthDatePickView.datePickerMode = .date
        dateTextField.inputView = birthDatePickView
        if #available(iOS 13.4, *) {
            birthDatePickView.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        birthDatePickView.addTarget(self, action: #selector(handleDatePicker), for: .valueChanged)
        
        bloodTypePickerView.delegate = self
        bloodTypePickerView.dataSource = self
        bloodTypeTextField.inputView = bloodTypePickerView
        
        
    }
    
    
    
    func style() {
        addRedBorder(view: dateView)
        
        continueButton.layer.cornerRadius = continueButton.layer.frame.height / 2
        locationButton.layer.cornerRadius = locationButton.layer.frame.height / 2
        
        cardView.dropShadow(scale: true)
        cardView.addSpecificCornerRadius(forCorners: .Top, radius: 60)
    }
    
    func addRedBorder(view: UIView){
        view.layer.borderWidth = 1
        view.layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
    }
    
    @objc func handleDatePicker() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"

        let dateString = dateFormatter.string(from: birthDatePickView.date)
        dateTextField.text = dateString
    }
    
    @objc func handleBloodTypePicker() {
        
    }
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        if let presenter = presenter as? SignUpPresenter {
            presenter.continueClicked(
                fullName: fullNameTextField.text.nonNullString,
                phoneNumber: phoneNumberTextField.text.nonNullString,
                birthDate: dateTextField.text.nonNullString,
                bloodType: bloodTypeTextField.text.nonNullString,
                address: addressTextField.text.nonNullString,
                password: passwordTextField.text.nonNullString,
                passwordConfirmation: passwordConfirmationTextField.text.nonNullString
            )
        }
    }
    
    
    @IBAction func genderRadioClicked(_ sender: UIButton) {
        if sender.tag == 0 {
            maleRadiobutton.setImage(UIImage(named: "Radio button - Selected"), for: .normal)
            femaleRadioButton.setImage(UIImage(named: "Radio button - Empty"), for: .normal)
            selectedGender = "Male"
        }
        else{
            femaleRadioButton.setImage(UIImage(named: "Radio button - Selected"), for: .normal)
            maleRadiobutton.setImage(UIImage(named: "Radio button - Empty"), for: .normal)
            selectedGender = "Female"
        }
    }
    

    

}

extension SignUpViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        bloodTypes?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        bloodTypeTextField.text = bloodTypes![row]
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        bloodTypes![row]
    }
    
}
