//
//  SignUpViewController.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 30/12/2020.
//

import UIKit
import JVFloatLabeledTextField

class SignUpViewController: BaseViewController {
    
    @IBOutlet weak var firstNameTextField: FirstNameTextField!
    @IBOutlet weak var secondNameTextField: LastNameTextField!
    @IBOutlet weak var phoneNumberTextField: PhoneNumberTextField!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var dateTextField: BirthDateTextField!
    @IBOutlet weak var bloodTypeTextField: BloodTypeTextField!
    @IBOutlet weak var genderTextField: GenderTextField!
    @IBOutlet weak var addressTextField: LocationTextField!
    @IBOutlet weak var passwordTextField: PasswordTextField!
    @IBOutlet weak var passwordConfirmationTextField: PasswordConfirmationTextField!
    
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var cardView: UIView!
    
    var birthDatePickView: UIDatePicker = UIDatePicker()
    var bloodTypePickerView: UIPickerView = UIPickerView()
    var bloodTypes: [String]? {
        didSet {
            bloodTypePickerView.reloadAllComponents()
        }
    }
    var genderPickerView: UIPickerView = UIPickerView()
    var genders: [String]? {
        didSet {
            genderPickerView.reloadAllComponents()
        }
    }
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
        bloodTypePickerView.tag = 1
        bloodTypeTextField.inputView = bloodTypePickerView
        
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        genderPickerView.tag = 2
        genderTextField.inputView = genderPickerView
        
        
        
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
    
    func isAllInputValid() -> Bool {
        return firstNameTextField.isValidEntry && secondNameTextField.isValidEntry && phoneNumberTextField.isValidEntry && dateTextField.isValidEntry && bloodTypeTextField.isValidEntry && genderTextField.isValidEntry && addressTextField.isValidEntry && passwordTextField.isValidEntry && passwordConfirmationTextField.isValidEntry && (passwordTextField.text == passwordConfirmationTextField.text)
    }
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        if let presenter = presenter as? SignUpPresenter {
            presenter.continueClicked(
                firstName: firstNameTextField.text.nonNullString,
                lastName: secondNameTextField.text.nonNullString,
                phoneNumber: phoneNumberTextField.text.nonNullString,
                birthDate: dateTextField.text.nonNullString,
                bloodType: bloodTypeTextField.text.nonNullString,
                password: passwordTextField.text.nonNullString,
                passwordConfirmation: passwordConfirmationTextField.text.nonNullString
            )
        }
    }
    
    

    

    

}

extension SignUpViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return bloodTypes?.count ?? 0
        }
        else if pickerView.tag == 2 {
            return genders?.count ?? 0
        }
        else {
            fatalError("Unexpected sender")
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            bloodTypeTextField.text = bloodTypes![row]
        }
        else if pickerView.tag == 2 {
            genderTextField.text = genders![row]
        }
        else {
            fatalError("Unexpected sender")
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return bloodTypes![row]
        }
        else if pickerView.tag == 2 {
            return genders![row]
        }
        else {
            fatalError("Unexpected sender")
        }
    }
    
    
}
