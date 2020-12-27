//
//  LaunchPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//  
//

import Foundation

class LaunchScreenPresenter: BasePresenter {

    
    
    override func viewDidLoad() {
        LaunchInteractor.shared.initializeApp()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            if LaunchInteractor.shared.isUserSignedIn() {
                // Call router to launch home page
            } else {
                // Call router to launch authorization page
                LaunchRouter.shared.launchAuthorizationPage()
                
            }
        }
    }
}
