//
//  NewRequestPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import Foundation

enum UIState {
    case Enabled
    case Disabled
}

class NewRequestPresenter: BasePresenter {
    var bloodBanksManager: BloodBanksManager!
    var uiState = UIState.Enabled
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear() {
        guard let view = view as? NewRequestViewController else {fatalError()}
        showLoading()
        NewRequestInteractor.shared.canUserCreateRequest { response in
            self.dismissLoading()
            switch response {
            
            case .success(let result):
                self.bloodBanksManager = BloodBanksManager(bloodBanksResponse: result)
                view.governorates = self.bloodBanksManager.getGovernorates()
                if self.uiState == .Disabled {
                    self.enableUI()
                }
                
            case .failure(let error):
                view.showAlert(error: error) {
                    if self.uiState == .Enabled {
                        self.disableUI()
                    }
                }
            }
        }
    }
    
    func governorateLocationChanged(change: String){
        guard let view = view as? NewRequestViewController else {fatalError()}
        view.enableUserInteraction(dropdownImage: view.regionDropdownImage, containerView: view.regionView)
        view.regionTextField.text = ""
        view.bloodBankTextField.text = ""
        view.disableUserInteraction(dropdownImage: view.bloodBankDropdownImage, containerView: view.bloodBankView)
        view.regions = bloodBanksManager.getRegions(forGovernorate: change)
    }
    
    func regionLocationChanged(change: String){
        guard let view = view as? NewRequestViewController else {fatalError()}
        view.enableUserInteraction(dropdownImage: view.bloodBankDropdownImage, containerView: view.bloodBankView)
        view.bloodBankTextField.text = ""
        view.bloodBanks = bloodBanksManager.getBloodBanks(forGovernorate: view.governoratesTextField.text!, forCity: change)
    }
    
    func disableUI() {
        guard let view = view as? NewRequestViewController else {fatalError()}
        
        view.disclaimerLabel.textColor = ThemeConstants.colorLightGray
        
        view.bloodTypeLabel.textColor = ThemeConstants.colorLightGray
        view.btButton1.setTitleColor(ThemeConstants.colorLightGray, for: .normal)
        view.btButton2.setTitleColor(ThemeConstants.colorLightGray, for: .normal)
        view.btButton3.setTitleColor(ThemeConstants.colorLightGray, for: .normal)
        view.btButton4.setTitleColor(ThemeConstants.colorLightGray, for: .normal)
        view.btButton5.setTitleColor(ThemeConstants.colorLightGray, for: .normal)
        view.btButton6.setTitleColor(ThemeConstants.colorLightGray, for: .normal)
        view.btButton7.setTitleColor(ThemeConstants.colorLightGray, for: .normal)
        view.btButton8.setTitleColor(ThemeConstants.colorLightGray, for: .normal)
        view.btButton1.layer.borderColor = ThemeConstants.colorLightGray.cgColor
        view.btButton2.layer.borderColor = ThemeConstants.colorLightGray.cgColor
        view.btButton3.layer.borderColor = ThemeConstants.colorLightGray.cgColor
        view.btButton4.layer.borderColor = ThemeConstants.colorLightGray.cgColor
        view.btButton5.layer.borderColor = ThemeConstants.colorLightGray.cgColor
        view.btButton6.layer.borderColor = ThemeConstants.colorLightGray.cgColor
        view.btButton7.layer.borderColor = ThemeConstants.colorLightGray.cgColor
        view.btButton8.layer.borderColor = ThemeConstants.colorLightGray.cgColor
        
        view.bloodUnitsLabel.textColor = ThemeConstants.colorLightGray
        view.bloodBagsLabel.textColor = ThemeConstants.colorLightGray
        view.plusButton.setTitleColor(ThemeConstants.colorLightGray, for: .normal)
        view.plusButton.layer.borderColor = ThemeConstants.colorLightGray.cgColor
        view.minusButton.setTitleColor(ThemeConstants.colorLightGray, for: .normal)
        view.minusButton.layer.borderColor = ThemeConstants.colorLightGray.cgColor
        
        view.locationLabel.textColor = ThemeConstants.colorLightGray
        view.disableUserInteraction(dropdownImage: view.regionDropdownImage, containerView: view.regionView)
        view.disableUserInteraction(dropdownImage: view.governoratesDropdownImage, containerView: view.governoratesView)
        view.disableUserInteraction(dropdownImage: view.bloodBankDropdownImage, containerView: view.bloodBankView)
        
        view.requestButton.setTitleColor(ThemeConstants.colorLightGray, for: .normal)
        view.requestButton.backgroundColor = ThemeConstants.colorLightGray
        
        view.view.isUserInteractionEnabled = false
        uiState = .Disabled
    }
    
    func enableUI() {
        guard let view = view as? NewRequestViewController else {fatalError()}
        
        view.disclaimerLabel.textColor = ThemeConstants.colorShoryanMain
        
        view.bloodTypeLabel.textColor = ThemeConstants.colorShoryanMain
        view.btButton1.setTitleColor(ThemeConstants.colorShoryanMain, for: .normal)
        view.btButton2.setTitleColor(ThemeConstants.colorShoryanMain, for: .normal)
        view.btButton3.setTitleColor(ThemeConstants.colorShoryanMain, for: .normal)
        view.btButton4.setTitleColor(ThemeConstants.colorShoryanMain, for: .normal)
        view.btButton5.setTitleColor(ThemeConstants.colorShoryanMain, for: .normal)
        view.btButton6.setTitleColor(ThemeConstants.colorShoryanMain, for: .normal)
        view.btButton7.setTitleColor(ThemeConstants.colorShoryanMain, for: .normal)
        view.btButton8.setTitleColor(ThemeConstants.colorShoryanMain, for: .normal)
        view.btButton1.layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        view.btButton2.layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        view.btButton3.layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        view.btButton4.layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        view.btButton5.layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        view.btButton6.layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        view.btButton7.layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        view.btButton8.layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        
        view.bloodUnitsLabel.textColor = ThemeConstants.colorShoryanMain
        view.bloodBagsLabel.textColor = .black
        view.plusButton.setTitleColor(ThemeConstants.colorShoryanMain, for: .normal)
        view.plusButton.layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        view.minusButton.setTitleColor(ThemeConstants.colorShoryanMain, for: .normal)
        view.minusButton.layer.borderColor = ThemeConstants.colorShoryanMain.cgColor
        
        view.locationLabel.textColor = ThemeConstants.colorShoryanMain
        view.disableUserInteraction(dropdownImage: view.regionDropdownImage, containerView: view.regionView)
        view.enableUserInteraction(dropdownImage: view.governoratesDropdownImage, containerView: view.governoratesView)
        view.disableUserInteraction(dropdownImage: view.bloodBankDropdownImage, containerView: view.bloodBankView)
        
        
        view.requestButton.setTitleColor(.white, for: .normal)
        view.requestButton.backgroundColor = ThemeConstants.colorShoryanMain
        
        view.view.isUserInteractionEnabled = true
        uiState = .Enabled
    }
    
    
    func newRequestButtonClicked(withBloodType bloodType: String, bagsCount: Int, bloodBankID: String) {
        guard let view = view as? NewRequestViewController else {
            return
        }
        if bloodType != "", bagsCount != 0, bloodBankID != "" {
            NewRequestInteractor.shared.createNewRequest(bloodType: bloodType, numberOfBagsRequired: bagsCount, donationLocation: bloodBankID) { response in
                switch response {
                case .success(_):
                    view.showAlert(title: "Done".localized(), message: "newrequestsuccess.alert".localized())
                case .failure(let error):
                    view.showAlert(error: error)
                }
            }
        }
        else {
            view.showAlert(title: "Error".localized(), message: "incorrectinput.alert".localized())
        }
    }
}
