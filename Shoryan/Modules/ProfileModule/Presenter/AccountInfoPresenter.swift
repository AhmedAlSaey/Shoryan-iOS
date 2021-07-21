//
//  AccountInfoPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 21/07/2021.
//

import Foundation

class AccountInfoPresenter: BasePresenter {
    var selectedLocationLng: Double?
    var selectedLocationLat: Double?
    var selectedLocationCity: String?
    var selectedLocationGovernorate: String?
    
    var firstName: String!
    var lastName: String!
    var birthDate: Date!
    var bloodType: String!
    var gender: String!
    
    var firstAppearance = true
    
    override func viewDidLoad() {
        guard let view = view as? AccountInfoViewController else {fatalError()}
        
        view.bloodTypes = ProfileInteractor.shared.getBloodTypes()
        view.genders = ProfileInteractor.shared.getGenders()
        
        view.firstNameTextField.validate = ProfileInteractor.shared.getFirstNameValidationFunction()
        view.secondNameTextField.validate = ProfileInteractor.shared.getLastNameValidationFunction()
        
        view.dateTextField.validate = ProfileInteractor.shared.getBirthDateValidationFunction()
        view.bloodTypeTextField.validate = ProfileInteractor.shared.getBloodTypeValidationFunction()
        view.genderTextField.validate = ProfileInteractor.shared.getGenderValidationFunction()
        view.addressTextField.validate = ProfileInteractor.shared.getLocationValidationFunction()
        
    }
    
    override func viewDidAppear() {
        if firstAppearance {
            showLoading()
            autoFillDataVariables()
            autofillTextfields()
            dismissLoading(delay: 0.5)
            firstAppearance = false
        }
    }
    
    func autoFillDataVariables() {
        self.selectedLocationLng = ProfileInteractor.shared.getUserLongitude()
        self.selectedLocationLat = ProfileInteractor.shared.getUserLatitude()
        self.selectedLocationCity = ProfileInteractor.shared.getUserRegion()
        self.selectedLocationGovernorate = ProfileInteractor.shared.getUserGovernorate()
        self.firstName = ProfileInteractor.shared.getUserFistName()
        self.lastName = ProfileInteractor.shared.getUserLastName()
        // Specify date components
        var dateComponents = DateComponents()
        dateComponents.year = ProfileInteractor.shared.getUserBirthYear()
        dateComponents.month = ProfileInteractor.shared.getUserBirthMonth()
        dateComponents.day = ProfileInteractor.shared.getUserBirthDay()
        // Create date from components
        let userCalendar = Calendar(identifier: .gregorian)
        self.birthDate = userCalendar.date(from: dateComponents)
        self.bloodType = ProfileInteractor.shared.getUserBloodType()
        self.gender = ProfileInteractor.shared.getUserGenderName()
        
    }
    
    func autofillTextfields() {
        guard let view = view as? AccountInfoViewController else {fatalError()}
        view.firstNameTextField.text = ProfileInteractor.shared.getUserFistName()
        view.secondNameTextField.text = ProfileInteractor.shared.getUserLastName()
        
        // Specify date components
        var dateComponents = DateComponents()
        dateComponents.year = ProfileInteractor.shared.getUserBirthYear()
        dateComponents.month = ProfileInteractor.shared.getUserBirthMonth()
        dateComponents.day = ProfileInteractor.shared.getUserBirthDay()
        view.dateTextField.text = "\(ProfileInteractor.shared.getUserBirthDay())-\(ProfileInteractor.shared.getUserBirthMonth())-\(ProfileInteractor.shared.getUserBirthYear())"

        // Create date from components
        let userCalendar = Calendar(identifier: .gregorian) // since the components above (like year 1980) are for Gregorian
        view.birthDatePickView.setDate(userCalendar.date(from: dateComponents)!, animated: false)
        let index = view.bloodTypes!.firstIndex(of: ProfileInteractor.shared.getUserBloodType())
        let indexInt = view.bloodTypes!.distance(from: view.bloodTypes!.startIndex, to: index!)
        view.bloodTypePickerView.selectRow(indexInt, inComponent: 0, animated: true)
        view.bloodTypeTextField.text = ProfileInteractor.shared.getUserBloodType()
        
        let genderName = ProfileInteractor.shared.getUserGenderName()
        let index2 = view.genders!.firstIndex(of: genderName)
        let indexInt2 = view.genders!.distance(from: view.genders!.startIndex, to: index2!)
        view.genderPickerView.selectRow(indexInt2, inComponent: 0, animated: true)
        view.genderTextField.text = ProfileInteractor.shared.getUserGenderName()
        
        view.addressTextField.text = ProfileInteractor.shared.getUserRegion() + ", " + ProfileInteractor.shared.getUserGovernorate()
        
    }
    
    
    
    func saveClicked(firstName: String, lastName: String, birthDate: Date, bloodType: String, gender: String){
        
        if let view = view as? AccountInfoViewController {
            if view.isAllInputValid(), let lat = selectedLocationLat, let lng = selectedLocationLng {
                
                self.firstName = firstName
                self.lastName = lastName
                self.birthDate = birthDate
                self.bloodType = bloodType
                self.gender = gender
                
                showLoading()
                ProfileInteractor.shared.editUserInfo(
                    firstName: firstName,
                    lastName: lastName,
                    birthDate: birthDate,
                    bloodType: bloodType,
                    gender: gender,
                    lng: lat,
                    lat: lng,
                    governorate: selectedLocationGovernorate!,
                    region: selectedLocationCity!) { (result) in
                    self.dismissLoading()
                    switch result {
                    case.success(_):
                        view.showAlert(title: "Success".localized(), message: "accountinfochanges.alert".localized()) {
                            ProfileRouter.shared.dissmissAccountInfo()
                        }
                        break;
                    case.failure(let error):
                        view.showAlert(error: error)
                    }
                }
            }
            else {
                view.showAlert(message: "incorrectinput.alert".localized())
            }
        }
        
        
        
        
    }
    
    func backButtonPressed() {
        ProfileRouter.shared.dissmissAccountInfo()
    }
    
    func locationButtonPressed() {
        ProfileRouter.shared.pushMapSelector(delegate: self)
    }
}

extension AccountInfoPresenter: MapSelectorDelegate{
    func didSelectLocation(lng: Double, lat: Double, city: String?, governorate: String?, formattedAddress: String?) {
        selectedLocationLng = lng
        selectedLocationLat = lat
        selectedLocationCity = city
        selectedLocationGovernorate = governorate
        
        if let view = view as? AccountInfoViewController {
            view.addressTextField.text = formattedAddress
        }
        ProfileRouter.shared.dissmissMapSelector()
    }
    
    func didPressBackButton() {
        ProfileRouter.shared.dissmissMapSelector()
    }
    
    
}
