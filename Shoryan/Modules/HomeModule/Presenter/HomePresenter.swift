//
//  HomePresenter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import Foundation

class HomePresenter: BasePresenter {

    override func viewDidLoad() {
        let requests = HomeInteractor.shared.getRequestList()
        if let view = view as? HomeViewController {
            view.requests = requests
        }
    }
}
