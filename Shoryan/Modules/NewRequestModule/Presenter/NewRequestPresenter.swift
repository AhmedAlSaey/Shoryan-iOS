//
//  NewRequestPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import Foundation

class NewRequestPresenter: BasePresenter {
    var bloodBanksManager: BloodBanksManager!
    
    override func viewDidLoad() {
        guard let view = view as? NewRequestViewController else {fatalError()}
        showLoading()
        NewRequestInteractor.shared.canUserCreateRequest { response in
            self.dismissLoading()
            switch response {
            case .success(let result):
                self.bloodBanksManager = BloodBanksManager(bloodBanksResponse: result)
                view.governorates = self.bloodBanksManager.getGovernorates()
                
            case .failure(let error):
                view.showAlert(error: error)
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
        view.bloodBanks = bloodBanksManager.getBloodBanks(forGovernorate: view.governoratesTextField.text!, forCity: change).map { $0.0 }
    }
    
    
}
