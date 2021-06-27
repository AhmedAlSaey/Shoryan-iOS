//
//  SuccessRedeemPresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 27/06/2021.
//

import Foundation

class SuccessRedeemPresenter: BasePresenter {
    
    func closeButtonPressed() {
        HomeRouter.shared.popToRootViewController()
    }
}
