//
//  HomePresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import Foundation
import JGProgressHUD

class HomePresenter: BasePresenter {
    let hud = JGProgressHUD()
    
    override func viewDidLoad() {
        
        self.hud.textLabel.text = "Loading"
        self.hud.show(in: self.view!.view)
        
        HomeInteractor.shared.getOngoingRequestsList { (result) in
            DispatchQueue.main.async {
                self.hud.dismiss(animated: true)
                switch result {
                case .success(let simpleRequests):
                    (self.view as! HomeViewController).requests = simpleRequests
                case .failure(let error):
                    (self.view as! HomeViewController).showAlert(error: error)
                }
            }
            
        }
    }
}

