//
//  NewRequestRouter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 31/12/2020.
//
import UIKit

class NewRequestRouter: BaseRouter {
    
    
    var navigationController: UINavigationController?
    
    static let shared = NewRequestRouter()
    
    
    func createNewRequest() -> UIViewController {
        let viewController = NewRequestViewController()
        
        let presenter = NewRequestPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        
        return viewController
    }
    
    func launchNewRequestPage() {
        let nc = embedInNavigationController(viewController: createNewRequest())
        navigationController = nc
        
        self.initializeWindowWithNavigationControllerAnimation(rootViewController: nc)
    }
    
}
