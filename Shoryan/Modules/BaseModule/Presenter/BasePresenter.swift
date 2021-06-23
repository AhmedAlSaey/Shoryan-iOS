//
//  BasePresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/12/2020.
//

import Foundation
import JGProgressHUD

class BasePresenter {
    var view: BaseViewController?
    let hud = JGProgressHUD()
    
    func showLoading() {
        self.hud.textLabel.text = "Loading"
        self.hud.show(in: self.view!.view)
    }
    func dismissLoading() {
        self.hud.dismiss(animated: true)
    }
    
    func viewDidLoad(){
        
    }
}
