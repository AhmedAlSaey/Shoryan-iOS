//
//  ProfileRouter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//

import UIKit

class ProfileRouter: BaseRouter {
    
    
    var navigationController: UINavigationController?
    
    static let shared = ProfileRouter()
    
    
    func createProfile() -> UIViewController {
        let viewController = ProfileViewController()
        
        let presenter = ProfilePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
    func createProfileEmbeddedInViewController() -> UIViewController {
        let nc = embedInNavigationController(viewController: createProfile())
        navigationController = nc
        nc.isNavigationBarHidden = true
        return nc
    }
    
}
