//
//  HomeRouter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import Foundation

import UIKit

class HomeRouter: BaseRouter {
    
    
    var navigationController: UINavigationController?
    
    static let shared = HomeRouter()
    
    
    func createHomePage() -> UIViewController {
        let viewController = HomeViewController()
        
        let presenter = HomePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
    func launchHomePage() {
        let nc = embedInNavigationController(viewController: createHomePage())
        navigationController = nc
        
        self.initializeWindowWithNavigationControllerAnimation(rootViewController: nc)
    }
    
}
