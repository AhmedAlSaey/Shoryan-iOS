//
//  HomePresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import Foundation

class HomePresenter: BasePresenter {

    override func viewDidLoad() {
        
        let ongoingRequests = HomeInteractor.shared.getOngoingRequestsList()
        if let view = view as? HomeViewController {
            view.requests = ongoingRequests
        }
    }
}

