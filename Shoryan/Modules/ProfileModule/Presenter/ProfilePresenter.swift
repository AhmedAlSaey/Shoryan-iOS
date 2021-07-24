//
//  ProfilePresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import Foundation

class ProfilePresenter: BasePresenter {

    override func viewDidLoad() {
        
    }
    
    override func viewDidAppear() {
        guard let view  = view as? ProfileViewController else {fatalError()}
        view.pointsCountLabel.text = ProfileInteractor.shared.getUserPoints()
        view.donationsCountLabel.text = ProfileInteractor.shared.getUserDonation()
    }
    
    func languageButtonClicked() {
        guard let view = view as? ProfileViewController else {return}
        ProfileRouter.shared.presentLanguageSelectionScreen(onTopOf: view)
    }
    
    func logoutButtonClicked(){
        ProfileInteractor.shared.clearUserData()
        ProfileRouter.shared.launchAuthorizationPage()
    }
    
    func changePasswordClicked() {
        ProfileRouter.shared.pushChangePassword()
    }
    
    func accountInfoClicked() {
        ProfileRouter.shared.pushAccountInfo()
    }
}
